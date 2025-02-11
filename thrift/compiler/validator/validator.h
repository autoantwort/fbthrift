/*
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#pragma once

#include <string>
#include <vector>

#include <thrift/compiler/ast/visitor.h>
#include <thrift/compiler/lib/cpp2/util.h>
#include <thrift/compiler/sema/diagnostic.h>

#include <boost/optional.hpp>

namespace apache {
namespace thrift {
namespace compiler {

class validator : virtual public visitor {
 public:
  using diagnostics_t = std::vector<diagnostic>;
  static diagnostics_t validate(t_program* program);

  using visitor::visit;

  // must call set_program if overriding this overload
  bool visit(t_program* program) override;

  void set_program(t_program* const program);

 protected:
  void add_error(boost::optional<int> const lineno, std::string const& message);

 private:
  template <typename T, typename... Args>
  friend std::unique_ptr<T> make_validator(diagnostics_t&, Args&&...);

  void set_ref_diagnostics(diagnostics_t& diagnostics);

  diagnostics_t* diagnostics_{};
  t_program const* program_{};
};

template <typename T, typename... Args>
std::unique_ptr<T> make_validator(
    validator::diagnostics_t& diagnostics, Args&&... args) {
  auto ptr = std::unique_ptr<T>(new T(std::forward<Args>(args)...));
  ptr->set_ref_diagnostics(diagnostics);
  return ptr;
}

template <typename T, typename... Args>
validator::diagnostics_t run_validator(
    t_program* const program, Args&&... args) {
  validator::diagnostics_t diagnostics;
  make_validator<T>(diagnostics, std::forward<Args>(args)...)
      ->traverse(program);
  return diagnostics;
}

class validator_list {
 public:
  explicit validator_list(validator::diagnostics_t& diagnostics)
      : diagnostics_(diagnostics) {}

  template <typename T, typename... Args>
  void add(Args&&... args) {
    auto ptr = make_validator<T>(diagnostics_, std::forward<Args>(args)...);
    validators_.push_back(std::move(ptr));
  }

  void traverse(t_program* const program);

 private:
  validator::diagnostics_t& diagnostics_;
  std::vector<std::unique_ptr<validator>> validators_;
};

class exception_list_is_all_exceptions_validator : virtual public validator {
 public:
  using validator::visit;

  bool visit(t_service* service) override;

 private:
  /**
   * Check members of a throws block
   */
  static bool validate_throws(const t_throws* throws);
};

class field_names_uniqueness_validator : virtual public validator {
 public:
  using validator::visit;

  /**
   * Enforces that there are no duplicate field names either within this
   * struct or between this struct and any of its mixins.
   */
  bool visit(t_struct* s) override;
};

class struct_names_uniqueness_validator : virtual public validator {
 public:
  using validator::visit;

  /**
   * Enforces that there are no duplicate names between structs, exceptions, and
   * interactions
   */
  bool visit(t_program* s) override;
};

class interactions_validator : virtual public validator {
 public:
  using validator::visit;

  /**
   * Enforces that interactions are not nested
   */
  bool visit(t_program* s) override;
  /**
   * Enforces that services have at most one method for starting each
   * interaction
   */
  bool visit(t_service* s) override;
};

class reserved_field_id_validator : virtual public validator {
 public:
  using validator::visit;

  /// field id whose binary digital leads with `10` is reserved
  static constexpr int16_t kMinimalValidFieldId = 0b1100'0000'0000'0000;

  /**
   * check whether struct contains reserved field id
   */
  bool visit(t_struct* s) override;
};

class recursive_union_validator : virtual public validator {
  using validator::visit;

  /**
   * Enforces that the cpp.box annotation is not used in unions.
   *
   * TODO(daandemeyer): Remove when cpp.box union support is added.
   */
  bool visit(t_struct* s) override;
};

class recursive_ref_validator : virtual public validator {
  using validator::visit;

  /**
   * Enforces that the cpp.box annotation is not used in combination with the
   * cpp.ref or cpp.ref_type annotations.
   */
  bool visit(t_struct* s) override;
};

class recursive_optional_validator : virtual public validator {
  using validator::visit;

  /**
   * Enforces that the cpp.box annotation is only used with optional fields.
   */
  bool visit(t_struct* s) override;
};

} // namespace compiler
} // namespace thrift
} // namespace apache
