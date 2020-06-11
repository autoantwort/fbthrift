# Copyright (c) Facebook, Inc. and its affiliates.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

cimport cython

from types import MappingProxyType

def inspect(cls):
  if not isinstance(cls, type):
    cls = type(cls)
  if hasattr(cls, '__get_reflection__'):
    return cls.__get_reflection__()
  raise TypeError('No reflection information found')


def inspectable(cls):
  if not isinstance(cls, type):
    cls = type(cls)
  return hasattr(cls, '__get_reflection__')


@cython.auto_pickle(False)
cdef class StructSpec:
    def __cinit__(self, str name, fields, StructType kind, dict annotations = {}):
        self.name = name
        self.fields = tuple(fields)
        self.kind = kind
        self.annotations = MappingProxyType(annotations)

    @staticmethod
    cdef create(str name, tuple fields, StructType kind, dict annotations):
        return StructSpec.__new__(StructSpec, name, fields, kind, annotations)

    def __iter__(self):
        yield self.name
        yield self.fields
        yield self.kind
        yield self.annotations

    def __eq__(self, other):
        if not isinstance(other, StructSpec):
            return False
        return tuple(self) == tuple(other)


@cython.auto_pickle(False)
cdef class FieldSpec:
    def __cinit__(
        self,
        str name,
        type,
        NumberType kind,
        Qualifier qualifier,
        default,
        dict annotations = {},
    ):
        self.name = name
        self.type = type
        self.kind = NumberType(kind)
        self.qualifier = Qualifier(qualifier)
        self.default = default
        self.annotations = MappingProxyType(annotations)

    @staticmethod
    cdef create(
        str name,
        object type,
        NumberType kind,
        Qualifier qualifier,
        object default,
        dict annotations,
    ):
        return FieldSpec.__new__(FieldSpec, name, type, kind, qualifier, default, annotations)

    def __iter__(self):
        yield self.name
        yield self.type
        yield self.kind
        yield self.qualifier
        yield self.default
        yield self.annotations

    def __eq__(self, other):
        if not isinstance(other, FieldSpec):
            return False
        return tuple(self) == tuple(other)


@cython.auto_pickle(False)
cdef class ListSpec:
    def __cinit__(self, value, NumberType kind):
        self.value = value
        self.kind = NumberType(kind)

    @staticmethod
    cdef create(object value, NumberType kind):
        return ListSpec.__new__(ListSpec, value, kind)

    def __iter__(self):
        yield self.value
        yield self.kind

    def __eq__(self, other):
        if not isinstance(other, ListSpec):
            return False
        return tuple(self) == tuple(other)


@cython.auto_pickle(False)
cdef class SetSpec:
    def __cinit__(self, value, NumberType kind):
        self.value = value
        self.kind = NumberType(kind)

    @staticmethod
    cdef create(object value, NumberType kind):
        return SetSpec.__new__(SetSpec, value, kind)

    def __iter__(self):
        yield self.value
        yield self.kind

    def __eq__(self, other):
        if not isinstance(other, SetSpec):
            return False
        return tuple(self) == tuple(other)


@cython.auto_pickle(False)
cdef class MapSpec:
    def __cinit__(
        self,
        key,
        NumberType key_kind,
        value,
        NumberType value_kind,
    ):
        self.key = key
        self.key_kind = NumberType(key_kind)
        self.value = value
        self.value_kind = NumberType(value_kind)

    @staticmethod
    cdef create(
        object key,
        NumberType key_kind,
        object value,
        NumberType value_kind,
    ):
        return MapSpec.__new__(MapSpec, key, key_kind, value, value_kind)

    def __iter__(self):
        yield self.key
        yield self.key_kind
        yield self.value
        yield self.value_kind

    def __eq__(self, other):
        if not isinstance(other, MapSpec):
            return False
        return tuple(self) == tuple(other)


@cython.auto_pickle(False)
cdef class InterfaceSpec:
    def __cinit__(self, str name, methods, dict annotations = {}):
        self.name = name
        self.methods = tuple(methods)
        self.annotations = MappingProxyType(annotations)

    @staticmethod
    cdef create(str name, tuple methods, dict annotations):
        return InterfaceSpec.__new__(InterfaceSpec, name, methods, annotations)

    def __iter__(self):
        yield self.name
        yield self.methods
        yield self.annotations


    def __eq__(self, other):
        if not isinstance(other, InterfaceSpec):
            return False
        return tuple(self) == tuple(other)


@cython.auto_pickle(False)
cdef class MethodSpec:
    def __cinit__(
        self,
        str name,
        arguments,
        NumberType result_kind,
        result,
        exceptions = (),
        annotations = {}
    ):
        self.name = name
        self.arguments = tuple(arguments)
        self.result_kind = NumberType(result_kind)
        self.result = result
        self.exceptions = tuple(exceptions)
        self.annotations = MappingProxyType(annotations)

    @staticmethod
    cdef create(
        str name,
        tuple arguments,
        NumberType result_kind,
        object result,
        tuple exceptions,
        dict annotations,
    ):
        return MethodSpec.__new__(MethodSpec, name, arguments, result_kind, result, exceptions, annotations)

    def __iter__(self):
        yield self.name
        yield self.arguments
        yield self.result_kind
        yield self.result
        yield self.exceptions
        yield self.annotations

    def __eq__(self, other):
        if not isinstance(other, MethodSpec):
            return False
        return tuple(self) == tuple(other)


@cython.auto_pickle(False)
cdef class ArgumentSpec:
    def __cinit__(self, str name, NumberType kind, type, dict annotations = {}):
        self.name = name
        self.kind = NumberType(kind)
        self.type = type
        self.annotations = MappingProxyType(annotations)

    @staticmethod
    cdef create(str name, NumberType kind, type, dict annotations):
        return ArgumentSpec.__new__(ArgumentSpec, name, kind, type, annotations)

    def __iter__(self):
        yield self.name
        yield self.kind
        yield self.type
        yield self.annotations

    def __eq__(self, other):
        if not isinstance(other, ArgumentSpec):
            return False
        return tuple(self) == tuple(other)
