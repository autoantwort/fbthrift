/**
 * Autogenerated by Thrift
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
#pragma once

#include "thrift/compiler/test/fixtures/complex-union/gen-cpp2/module_types.h"
#include <thrift/lib/cpp/TApplicationException.h>
#include <folly/io/IOBuf.h>
#include <folly/io/IOBufQueue.h>
#include <thrift/lib/cpp/transport/THeader.h>
#include <thrift/lib/cpp2/server/Cpp2ConnContext.h>
#include <thrift/lib/cpp2/GeneratedCodeHelper.h>
#include <thrift/lib/cpp2/GeneratedSerializationCodeHelper.h>

#include <thrift/lib/cpp2/protocol/BinaryProtocol.h>
#include <thrift/lib/cpp2/protocol/CompactProtocol.h>
namespace cpp2 {

template <class Protocol_>
uint32_t ComplexUnion::read(Protocol_* iprot) {
  uint32_t xfer = 0;
  std::string fname;
  apache::thrift::protocol::TType ftype;
  int16_t fid;

  xfer += iprot->readStructBegin(fname);

  using apache::thrift::TProtocolException;


  xfer += iprot->readFieldBegin(fname, ftype, fid);
  if (ftype == apache::thrift::protocol::T_STOP) {
    this->__clear();
  } else {
    if (fid == std::numeric_limits<int16_t>::min()) {
      if (fname == "intValue") {
        fid = 1;
        ftype = apache::thrift::protocol::T_I64;
      }
      else if (fname == "stringValue") {
        fid = 5;
        ftype = apache::thrift::protocol::T_STRING;
      }
      else if (fname == "intListValue") {
        fid = 2;
        ftype = apache::thrift::protocol::T_LIST;
      }
      else if (fname == "stringListValue") {
        fid = 3;
        ftype = apache::thrift::protocol::T_LIST;
      }
      else if (fname == "typedefValue") {
        fid = 9;
        ftype = apache::thrift::protocol::T_MAP;
      }
      else if (fname == "stringRef") {
        fid = 14;
        ftype = apache::thrift::protocol::T_STRING;
      }
    }
    switch (fid) {
      case 1:
      {
        if (ftype == apache::thrift::protocol::T_I64) {
          this->set_intValue();
          xfer += iprot->readI64(this->mutable_intValue());
        } else {
          xfer += iprot->skip(ftype);
        }
        break;
      }
      case 5:
      {
        if (ftype == apache::thrift::protocol::T_STRING) {
          this->set_stringValue();
          xfer += iprot->readString(this->mutable_stringValue());
        } else {
          xfer += iprot->skip(ftype);
        }
        break;
      }
      case 2:
      {
        if (ftype == apache::thrift::protocol::T_LIST) {
          this->set_intListValue();
          this->mutable_intListValue() = std::vector<int64_t>();
          xfer += ::apache::thrift::detail::pm::protocol_methods< ::apache::thrift::type_class::list<::apache::thrift::type_class::integral>, std::vector<int64_t>>::read(*iprot, this->mutable_intListValue());
        } else {
          xfer += iprot->skip(ftype);
        }
        break;
      }
      case 3:
      {
        if (ftype == apache::thrift::protocol::T_LIST) {
          this->set_stringListValue();
          this->mutable_stringListValue() = std::vector<std::string>();
          xfer += ::apache::thrift::detail::pm::protocol_methods< ::apache::thrift::type_class::list<::apache::thrift::type_class::string>, std::vector<std::string>>::read(*iprot, this->mutable_stringListValue());
        } else {
          xfer += iprot->skip(ftype);
        }
        break;
      }
      case 9:
      {
        if (ftype == apache::thrift::protocol::T_MAP) {
          this->set_typedefValue();
          this->mutable_typedefValue() =  ::cpp2::containerTypedef();
          xfer += ::apache::thrift::detail::pm::protocol_methods< ::apache::thrift::type_class::map<::apache::thrift::type_class::integral, ::apache::thrift::type_class::string>,  ::cpp2::containerTypedef>::read(*iprot, this->mutable_typedefValue());
        } else {
          xfer += iprot->skip(ftype);
        }
        break;
      }
      case 14:
      {
        if (ftype == apache::thrift::protocol::T_STRING) {
          this->set_stringRef();
          xfer += iprot->readString((*this->mutable_stringRef()));
        } else {
          xfer += iprot->skip(ftype);
        }
        break;
      }
      default:
      {
        xfer += iprot->skip(ftype);
        break;
      }
    }
    xfer += iprot->readFieldEnd();
    xfer += iprot->readFieldBegin(fname, ftype, fid);
    if (UNLIKELY(ftype != apache::thrift::protocol::T_STOP)) {
      using apache::thrift::protocol::TProtocolException;
      TProtocolException::throwUnionMissingStop();
    }
  }
  xfer += iprot->readStructEnd();

  return xfer;
}

template <class Protocol_>
uint32_t ComplexUnion::serializedSize(Protocol_ const* prot_) const {
  uint32_t xfer = 0;
  xfer += prot_->serializedStructSize("ComplexUnion");
  switch(this->getType()) {
    case ComplexUnion::Type::intValue:
    {
      xfer += prot_->serializedFieldSize("intValue", apache::thrift::protocol::T_I64, 1);
      xfer += prot_->serializedSizeI64(this->get_intValue());
      break;
    }
    case ComplexUnion::Type::stringValue:
    {
      xfer += prot_->serializedFieldSize("stringValue", apache::thrift::protocol::T_STRING, 5);
      xfer += prot_->serializedSizeString(this->get_stringValue());
      break;
    }
    case ComplexUnion::Type::intListValue:
    {
      xfer += prot_->serializedFieldSize("intListValue", apache::thrift::protocol::T_LIST, 2);
      xfer += ::apache::thrift::detail::pm::protocol_methods< ::apache::thrift::type_class::list<::apache::thrift::type_class::integral>, std::vector<int64_t>>::serializedSize<false>(*prot_, this->get_intListValue());
      break;
    }
    case ComplexUnion::Type::stringListValue:
    {
      xfer += prot_->serializedFieldSize("stringListValue", apache::thrift::protocol::T_LIST, 3);
      xfer += ::apache::thrift::detail::pm::protocol_methods< ::apache::thrift::type_class::list<::apache::thrift::type_class::string>, std::vector<std::string>>::serializedSize<false>(*prot_, this->get_stringListValue());
      break;
    }
    case ComplexUnion::Type::typedefValue:
    {
      xfer += prot_->serializedFieldSize("typedefValue", apache::thrift::protocol::T_MAP, 9);
      xfer += ::apache::thrift::detail::pm::protocol_methods< ::apache::thrift::type_class::map<::apache::thrift::type_class::integral, ::apache::thrift::type_class::string>,  ::cpp2::containerTypedef>::serializedSize<false>(*prot_, this->get_typedefValue());
      break;
    }
    case ComplexUnion::Type::stringRef:
    {
      xfer += prot_->serializedFieldSize("stringRef", apache::thrift::protocol::T_STRING, 14);
      xfer += prot_->serializedSizeString((*this->get_stringRef()));
      break;
    }
    case ComplexUnion::Type::__EMPTY__:;
  }
  xfer += prot_->serializedSizeStop();
  return xfer;
}

template <class Protocol_>
uint32_t ComplexUnion::serializedSizeZC(Protocol_ const* prot_) const {
  uint32_t xfer = 0;
  xfer += prot_->serializedStructSize("ComplexUnion");
  switch(this->getType()) {
    case ComplexUnion::Type::intValue:
    {
      xfer += prot_->serializedFieldSize("intValue", apache::thrift::protocol::T_I64, 1);
      xfer += prot_->serializedSizeI64(this->get_intValue());
      break;
    }
    case ComplexUnion::Type::stringValue:
    {
      xfer += prot_->serializedFieldSize("stringValue", apache::thrift::protocol::T_STRING, 5);
      xfer += prot_->serializedSizeString(this->get_stringValue());
      break;
    }
    case ComplexUnion::Type::intListValue:
    {
      xfer += prot_->serializedFieldSize("intListValue", apache::thrift::protocol::T_LIST, 2);
      xfer += ::apache::thrift::detail::pm::protocol_methods< ::apache::thrift::type_class::list<::apache::thrift::type_class::integral>, std::vector<int64_t>>::serializedSize<false>(*prot_, this->get_intListValue());
      break;
    }
    case ComplexUnion::Type::stringListValue:
    {
      xfer += prot_->serializedFieldSize("stringListValue", apache::thrift::protocol::T_LIST, 3);
      xfer += ::apache::thrift::detail::pm::protocol_methods< ::apache::thrift::type_class::list<::apache::thrift::type_class::string>, std::vector<std::string>>::serializedSize<false>(*prot_, this->get_stringListValue());
      break;
    }
    case ComplexUnion::Type::typedefValue:
    {
      xfer += prot_->serializedFieldSize("typedefValue", apache::thrift::protocol::T_MAP, 9);
      xfer += ::apache::thrift::detail::pm::protocol_methods< ::apache::thrift::type_class::map<::apache::thrift::type_class::integral, ::apache::thrift::type_class::string>,  ::cpp2::containerTypedef>::serializedSize<false>(*prot_, this->get_typedefValue());
      break;
    }
    case ComplexUnion::Type::stringRef:
    {
      xfer += prot_->serializedFieldSize("stringRef", apache::thrift::protocol::T_STRING, 14);
      xfer += prot_->serializedSizeString((*this->get_stringRef()));
      break;
    }
    case ComplexUnion::Type::__EMPTY__:;
  }
  xfer += prot_->serializedSizeStop();
  return xfer;
}

template <class Protocol_>
uint32_t ComplexUnion::write(Protocol_* prot_) const {
  uint32_t xfer = 0;
  xfer += prot_->writeStructBegin("ComplexUnion");
  switch(this->getType()) {
    case ComplexUnion::Type::intValue:
    {
      xfer += prot_->writeFieldBegin("intValue", apache::thrift::protocol::T_I64, 1);
      xfer += prot_->writeI64(this->get_intValue());
      xfer += prot_->writeFieldEnd();
      break;
    }
    case ComplexUnion::Type::stringValue:
    {
      xfer += prot_->writeFieldBegin("stringValue", apache::thrift::protocol::T_STRING, 5);
      xfer += prot_->writeString(this->get_stringValue());
      xfer += prot_->writeFieldEnd();
      break;
    }
    case ComplexUnion::Type::intListValue:
    {
      xfer += prot_->writeFieldBegin("intListValue", apache::thrift::protocol::T_LIST, 2);
      xfer += ::apache::thrift::detail::pm::protocol_methods< ::apache::thrift::type_class::list<::apache::thrift::type_class::integral>, std::vector<int64_t>>::write(*prot_, this->get_intListValue());
      xfer += prot_->writeFieldEnd();
      break;
    }
    case ComplexUnion::Type::stringListValue:
    {
      xfer += prot_->writeFieldBegin("stringListValue", apache::thrift::protocol::T_LIST, 3);
      xfer += ::apache::thrift::detail::pm::protocol_methods< ::apache::thrift::type_class::list<::apache::thrift::type_class::string>, std::vector<std::string>>::write(*prot_, this->get_stringListValue());
      xfer += prot_->writeFieldEnd();
      break;
    }
    case ComplexUnion::Type::typedefValue:
    {
      xfer += prot_->writeFieldBegin("typedefValue", apache::thrift::protocol::T_MAP, 9);
      xfer += ::apache::thrift::detail::pm::protocol_methods< ::apache::thrift::type_class::map<::apache::thrift::type_class::integral, ::apache::thrift::type_class::string>,  ::cpp2::containerTypedef>::write(*prot_, this->get_typedefValue());
      xfer += prot_->writeFieldEnd();
      break;
    }
    case ComplexUnion::Type::stringRef:
    {
      xfer += prot_->writeFieldBegin("stringRef", apache::thrift::protocol::T_STRING, 14);
      xfer += prot_->writeString((*this->get_stringRef()));
      xfer += prot_->writeFieldEnd();
      break;
    }
    case ComplexUnion::Type::__EMPTY__:;
  }
  xfer += prot_->writeFieldStop();
  xfer += prot_->writeStructEnd();
  return xfer;
}

} // cpp2
namespace apache { namespace thrift {

}} // apache::thrift
namespace cpp2 {

template <class Protocol_>
uint32_t FinalComplexUnion::read(Protocol_* iprot) {
  uint32_t xfer = 0;
  std::string fname;
  apache::thrift::protocol::TType ftype;
  int16_t fid;

  xfer += iprot->readStructBegin(fname);

  using apache::thrift::TProtocolException;


  xfer += iprot->readFieldBegin(fname, ftype, fid);
  if (ftype == apache::thrift::protocol::T_STOP) {
    this->__clear();
  } else {
    if (fid == std::numeric_limits<int16_t>::min()) {
      if (fname == "thingOne") {
        fid = 1;
        ftype = apache::thrift::protocol::T_STRING;
      }
      else if (fname == "thingTwo") {
        fid = 2;
        ftype = apache::thrift::protocol::T_STRING;
      }
    }
    switch (fid) {
      case 1:
      {
        if (ftype == apache::thrift::protocol::T_STRING) {
          this->set_thingOne();
          xfer += iprot->readString(this->mutable_thingOne());
        } else {
          xfer += iprot->skip(ftype);
        }
        break;
      }
      case 2:
      {
        if (ftype == apache::thrift::protocol::T_STRING) {
          this->set_thingTwo();
          xfer += iprot->readString(this->mutable_thingTwo());
        } else {
          xfer += iprot->skip(ftype);
        }
        break;
      }
      default:
      {
        xfer += iprot->skip(ftype);
        break;
      }
    }
    xfer += iprot->readFieldEnd();
    xfer += iprot->readFieldBegin(fname, ftype, fid);
    if (UNLIKELY(ftype != apache::thrift::protocol::T_STOP)) {
      using apache::thrift::protocol::TProtocolException;
      TProtocolException::throwUnionMissingStop();
    }
  }
  xfer += iprot->readStructEnd();

  return xfer;
}

template <class Protocol_>
uint32_t FinalComplexUnion::serializedSize(Protocol_ const* prot_) const {
  uint32_t xfer = 0;
  xfer += prot_->serializedStructSize("FinalComplexUnion");
  switch(this->getType()) {
    case FinalComplexUnion::Type::thingOne:
    {
      xfer += prot_->serializedFieldSize("thingOne", apache::thrift::protocol::T_STRING, 1);
      xfer += prot_->serializedSizeString(this->get_thingOne());
      break;
    }
    case FinalComplexUnion::Type::thingTwo:
    {
      xfer += prot_->serializedFieldSize("thingTwo", apache::thrift::protocol::T_STRING, 2);
      xfer += prot_->serializedSizeString(this->get_thingTwo());
      break;
    }
    case FinalComplexUnion::Type::__EMPTY__:;
  }
  xfer += prot_->serializedSizeStop();
  return xfer;
}

template <class Protocol_>
uint32_t FinalComplexUnion::serializedSizeZC(Protocol_ const* prot_) const {
  uint32_t xfer = 0;
  xfer += prot_->serializedStructSize("FinalComplexUnion");
  switch(this->getType()) {
    case FinalComplexUnion::Type::thingOne:
    {
      xfer += prot_->serializedFieldSize("thingOne", apache::thrift::protocol::T_STRING, 1);
      xfer += prot_->serializedSizeString(this->get_thingOne());
      break;
    }
    case FinalComplexUnion::Type::thingTwo:
    {
      xfer += prot_->serializedFieldSize("thingTwo", apache::thrift::protocol::T_STRING, 2);
      xfer += prot_->serializedSizeString(this->get_thingTwo());
      break;
    }
    case FinalComplexUnion::Type::__EMPTY__:;
  }
  xfer += prot_->serializedSizeStop();
  return xfer;
}

template <class Protocol_>
uint32_t FinalComplexUnion::write(Protocol_* prot_) const {
  uint32_t xfer = 0;
  xfer += prot_->writeStructBegin("FinalComplexUnion");
  switch(this->getType()) {
    case FinalComplexUnion::Type::thingOne:
    {
      xfer += prot_->writeFieldBegin("thingOne", apache::thrift::protocol::T_STRING, 1);
      xfer += prot_->writeString(this->get_thingOne());
      xfer += prot_->writeFieldEnd();
      break;
    }
    case FinalComplexUnion::Type::thingTwo:
    {
      xfer += prot_->writeFieldBegin("thingTwo", apache::thrift::protocol::T_STRING, 2);
      xfer += prot_->writeString(this->get_thingTwo());
      xfer += prot_->writeFieldEnd();
      break;
    }
    case FinalComplexUnion::Type::__EMPTY__:;
  }
  xfer += prot_->writeFieldStop();
  xfer += prot_->writeStructEnd();
  return xfer;
}

} // cpp2
namespace apache { namespace thrift {

}} // apache::thrift
namespace cpp2 {

} // cpp2
