#
# Autogenerated by Thrift
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#  @generated
#

cimport cython
from cpython.version cimport PY_VERSION_HEX
from libc.stdint cimport (
    int8_t as cint8_t,
    int16_t as cint16_t,
    int32_t as cint32_t,
    int64_t as cint64_t,
)
from libcpp.memory cimport shared_ptr, make_shared, unique_ptr, make_unique
from libcpp.string cimport string
from libcpp cimport bool as cbool
from cpython cimport bool as pbool
from libcpp.vector cimport vector
from libcpp.set cimport set as cset
from libcpp.map cimport map as cmap
from cython.operator cimport dereference as deref
from cpython.ref cimport PyObject
from thrift.py3.reflection cimport (
  InterfaceSpec as __InterfaceSpec,
  MethodSpec as __MethodSpec,
  ArgumentSpec as __ArgumentSpec,
)
from thrift.py3.exceptions cimport (
    cTApplicationException,
    ApplicationError as __ApplicationError,
    cTApplicationExceptionType__UNKNOWN)
from thrift.py3.server cimport ServiceInterface, RequestContext, Cpp2RequestContext
from thrift.py3.server import RequestContext, pass_context
from folly cimport (
  cFollyPromise,
  cFollyUnit,
  c_unit
)
from thrift.py3.types cimport move
from thrift.py3.reflection cimport NumberType as __NumberType

if PY_VERSION_HEX >= 0x030702F0:  # 3.7.2 Final
    from thrift.py3.server cimport THRIFT_REQUEST_CONTEXT as __THRIFT_REQUEST_CONTEXT

cimport folly.futures
from folly.executor cimport get_executor
cimport folly.iobuf as __iobuf
import folly.iobuf as __iobuf
from folly.iobuf cimport move as move_iobuf

from thrift.py3.stream cimport cServerStream, cResponseAndServerStream
cimport module.types as _module_types
import module.types as _module_types

import asyncio
import functools
import sys
import traceback
import types as _py_types

from module.services_wrapper cimport cPubSubStreamingServiceInterface


cdef extern from "<utility>" namespace "std":
    cdef cFollyPromise[cResponseAndServerStream[cint32_t,cint32_t]] move_promise_cResponseAndServerStream__cint32_t_cint32_t "std::move"(
        cFollyPromise[cResponseAndServerStream[cint32_t,cint32_t]])
    cdef cFollyPromise[cServerStream[cint32_t]] move_promise_cServerStream__cint32_t "std::move"(
        cFollyPromise[cServerStream[cint32_t]])

@cython.auto_pickle(False)
cdef class Promise_cResponseAndServerStream__cint32_t_cint32_t:
    cdef cFollyPromise[cResponseAndServerStream[cint32_t,cint32_t]] cPromise

    @staticmethod
    cdef create(cFollyPromise[cResponseAndServerStream[cint32_t,cint32_t]] cPromise):
        inst = <Promise_cResponseAndServerStream__cint32_t_cint32_t>Promise_cResponseAndServerStream__cint32_t_cint32_t.__new__(Promise_cResponseAndServerStream__cint32_t_cint32_t)
        inst.cPromise = move_promise_cResponseAndServerStream__cint32_t_cint32_t(cPromise)
        return inst

@cython.auto_pickle(False)
cdef class Promise_cServerStream__cint32_t:
    cdef cFollyPromise[cServerStream[cint32_t]] cPromise

    @staticmethod
    cdef create(cFollyPromise[cServerStream[cint32_t]] cPromise):
        inst = <Promise_cServerStream__cint32_t>Promise_cServerStream__cint32_t.__new__(Promise_cServerStream__cint32_t)
        inst.cPromise = move_promise_cServerStream__cint32_t(cPromise)
        return inst

cdef object _PubSubStreamingService_annotations = _py_types.MappingProxyType({
})


@cython.auto_pickle(False)
cdef class PubSubStreamingServiceInterface(
    ServiceInterface
):
    annotations = _PubSubStreamingService_annotations

    def __cinit__(self):
        self._cpp_obj = cPubSubStreamingServiceInterface(
            <PyObject *> self,
            get_executor()
        )

    @staticmethod
    def pass_context_returnstream(fn):
        return pass_context(fn)

    async def returnstream(
            self,
            i32_from,
            i32_to):
        raise NotImplementedError("async def returnstream is not implemented")

    @staticmethod
    def pass_context_streamthrows(fn):
        return pass_context(fn)

    async def streamthrows(
            self,
            foo):
        raise NotImplementedError("async def streamthrows is not implemented")

    @staticmethod
    def pass_context_boththrows(fn):
        return pass_context(fn)

    async def boththrows(
            self,
            foo):
        raise NotImplementedError("async def boththrows is not implemented")

    @staticmethod
    def pass_context_responseandstreamthrows(fn):
        return pass_context(fn)

    async def responseandstreamthrows(
            self,
            foo):
        raise NotImplementedError("async def responseandstreamthrows is not implemented")

    @staticmethod
    def __get_reflection_for_returnstream():
        return __MethodSpec.create(
            name="returnstream",
            arguments=(
                __ArgumentSpec.create(
                    name="i32_from",
                    type=int,
                    kind=__NumberType.I32,
                    annotations={
                    },
                ),
                __ArgumentSpec.create(
                    name="i32_to",
                    type=int,
                    kind=__NumberType.I32,
                    annotations={
                    },
                ),
            ),
            result=_module_types.ServerStream__i32,
            result_kind=__NumberType.NOT_A_NUMBER,
            exceptions=(
            ),
            annotations={
            },
        )

    @staticmethod
    def __get_reflection_for_streamthrows():
        return __MethodSpec.create(
            name="streamthrows",
            arguments=(
                __ArgumentSpec.create(
                    name="foo",
                    type=int,
                    kind=__NumberType.I32,
                    annotations={
                    },
                ),
            ),
            result=_module_types.ServerStream__i32,
            result_kind=__NumberType.NOT_A_NUMBER,
            exceptions=(
            ),
            annotations={
            },
        )

    @staticmethod
    def __get_reflection_for_boththrows():
        return __MethodSpec.create(
            name="boththrows",
            arguments=(
                __ArgumentSpec.create(
                    name="foo",
                    type=int,
                    kind=__NumberType.I32,
                    annotations={
                    },
                ),
            ),
            result=_module_types.ServerStream__i32,
            result_kind=__NumberType.NOT_A_NUMBER,
            exceptions=(
                _module_types.FooEx,
            ),
            annotations={
            },
        )

    @staticmethod
    def __get_reflection_for_responseandstreamthrows():
        return __MethodSpec.create(
            name="responseandstreamthrows",
            arguments=(
                __ArgumentSpec.create(
                    name="foo",
                    type=int,
                    kind=__NumberType.I32,
                    annotations={
                    },
                ),
            ),
            result=_module_types.ResponseAndServerStream__i32_i32,
            result_kind=__NumberType.NOT_A_NUMBER,
            exceptions=(
                _module_types.FooEx,
            ),
            annotations={
            },
        )

    @classmethod
    def __get_reflection__(cls):
        return __InterfaceSpec.create(
            name="PubSubStreamingService",
            methods=(
                cls.__get_reflection_for_returnstream(),
                cls.__get_reflection_for_streamthrows(),
                cls.__get_reflection_for_boththrows(),
                cls.__get_reflection_for_responseandstreamthrows(),
            ),
            annotations={
            },
        )



cdef api void call_cy_PubSubStreamingService_returnstream(
    object self,
    Cpp2RequestContext* ctx,
    cFollyPromise[cServerStream[cint32_t]] cPromise,
    cint32_t i32_from,
    cint32_t i32_to
):
    __promise = Promise_cServerStream__cint32_t.create(move_promise_cServerStream__cint32_t(cPromise))
    arg_i32_from = i32_from
    arg_i32_to = i32_to
    __context = RequestContext.create(ctx)
    if PY_VERSION_HEX >= 0x030702F0:  # 3.7.2 Final
        __context_token = __THRIFT_REQUEST_CONTEXT.set(__context)
        __context = None
    asyncio.get_event_loop().create_task(
        PubSubStreamingService_returnstream_coro(
            self,
            __context,
            __promise,
            arg_i32_from,
            arg_i32_to
        )
    )
    if PY_VERSION_HEX >= 0x030702F0:  # 3.7.2 Final
        __THRIFT_REQUEST_CONTEXT.reset(__context_token)

async def PubSubStreamingService_returnstream_coro(
    object self,
    object ctx,
    Promise_cServerStream__cint32_t promise,
    i32_from,
    i32_to
):
    try:
        if ctx and getattr(self.returnstream, "pass_context", False):
            result = await self.returnstream(ctx,
                      i32_from,
                      i32_to)
        else:
            result = await self.returnstream(
                      i32_from,
                      i32_to)
    except __ApplicationError as ex:
        # If the handler raised an ApplicationError convert it to a C++ one
        promise.cPromise.setException(cTApplicationException(
            ex.type.value, ex.message.encode('UTF-8')
        ))
    except Exception as ex:
        print(
            "Unexpected error in service handler returnstream:",
            file=sys.stderr)
        traceback.print_exc()
        promise.cPromise.setException(cTApplicationException(
            cTApplicationExceptionType__UNKNOWN, repr(ex).encode('UTF-8')
        ))
    else:
        promise.cPromise.setValue(cServerStream[cint32_t]() # server streaming support is not implemented yet
)

cdef api void call_cy_PubSubStreamingService_streamthrows(
    object self,
    Cpp2RequestContext* ctx,
    cFollyPromise[cServerStream[cint32_t]] cPromise,
    cint32_t foo
):
    __promise = Promise_cServerStream__cint32_t.create(move_promise_cServerStream__cint32_t(cPromise))
    arg_foo = foo
    __context = RequestContext.create(ctx)
    if PY_VERSION_HEX >= 0x030702F0:  # 3.7.2 Final
        __context_token = __THRIFT_REQUEST_CONTEXT.set(__context)
        __context = None
    asyncio.get_event_loop().create_task(
        PubSubStreamingService_streamthrows_coro(
            self,
            __context,
            __promise,
            arg_foo
        )
    )
    if PY_VERSION_HEX >= 0x030702F0:  # 3.7.2 Final
        __THRIFT_REQUEST_CONTEXT.reset(__context_token)

async def PubSubStreamingService_streamthrows_coro(
    object self,
    object ctx,
    Promise_cServerStream__cint32_t promise,
    foo
):
    try:
        if ctx and getattr(self.streamthrows, "pass_context", False):
            result = await self.streamthrows(ctx,
                      foo)
        else:
            result = await self.streamthrows(
                      foo)
    except __ApplicationError as ex:
        # If the handler raised an ApplicationError convert it to a C++ one
        promise.cPromise.setException(cTApplicationException(
            ex.type.value, ex.message.encode('UTF-8')
        ))
    except Exception as ex:
        print(
            "Unexpected error in service handler streamthrows:",
            file=sys.stderr)
        traceback.print_exc()
        promise.cPromise.setException(cTApplicationException(
            cTApplicationExceptionType__UNKNOWN, repr(ex).encode('UTF-8')
        ))
    else:
        promise.cPromise.setValue(cServerStream[cint32_t]() # server streaming support is not implemented yet
)

cdef api void call_cy_PubSubStreamingService_boththrows(
    object self,
    Cpp2RequestContext* ctx,
    cFollyPromise[cServerStream[cint32_t]] cPromise,
    cint32_t foo
):
    __promise = Promise_cServerStream__cint32_t.create(move_promise_cServerStream__cint32_t(cPromise))
    arg_foo = foo
    __context = RequestContext.create(ctx)
    if PY_VERSION_HEX >= 0x030702F0:  # 3.7.2 Final
        __context_token = __THRIFT_REQUEST_CONTEXT.set(__context)
        __context = None
    asyncio.get_event_loop().create_task(
        PubSubStreamingService_boththrows_coro(
            self,
            __context,
            __promise,
            arg_foo
        )
    )
    if PY_VERSION_HEX >= 0x030702F0:  # 3.7.2 Final
        __THRIFT_REQUEST_CONTEXT.reset(__context_token)

async def PubSubStreamingService_boththrows_coro(
    object self,
    object ctx,
    Promise_cServerStream__cint32_t promise,
    foo
):
    try:
        if ctx and getattr(self.boththrows, "pass_context", False):
            result = await self.boththrows(ctx,
                      foo)
        else:
            result = await self.boththrows(
                      foo)
    except _module_types.FooEx as ex:
        promise.cPromise.setException(deref((<_module_types.FooEx> ex)._cpp_obj))
    except __ApplicationError as ex:
        # If the handler raised an ApplicationError convert it to a C++ one
        promise.cPromise.setException(cTApplicationException(
            ex.type.value, ex.message.encode('UTF-8')
        ))
    except Exception as ex:
        print(
            "Unexpected error in service handler boththrows:",
            file=sys.stderr)
        traceback.print_exc()
        promise.cPromise.setException(cTApplicationException(
            cTApplicationExceptionType__UNKNOWN, repr(ex).encode('UTF-8')
        ))
    else:
        promise.cPromise.setValue(cServerStream[cint32_t]() # server streaming support is not implemented yet
)

cdef api void call_cy_PubSubStreamingService_responseandstreamthrows(
    object self,
    Cpp2RequestContext* ctx,
    cFollyPromise[cResponseAndServerStream[cint32_t,cint32_t]] cPromise,
    cint32_t foo
):
    __promise = Promise_cResponseAndServerStream__cint32_t_cint32_t.create(move_promise_cResponseAndServerStream__cint32_t_cint32_t(cPromise))
    arg_foo = foo
    __context = RequestContext.create(ctx)
    if PY_VERSION_HEX >= 0x030702F0:  # 3.7.2 Final
        __context_token = __THRIFT_REQUEST_CONTEXT.set(__context)
        __context = None
    asyncio.get_event_loop().create_task(
        PubSubStreamingService_responseandstreamthrows_coro(
            self,
            __context,
            __promise,
            arg_foo
        )
    )
    if PY_VERSION_HEX >= 0x030702F0:  # 3.7.2 Final
        __THRIFT_REQUEST_CONTEXT.reset(__context_token)

async def PubSubStreamingService_responseandstreamthrows_coro(
    object self,
    object ctx,
    Promise_cResponseAndServerStream__cint32_t_cint32_t promise,
    foo
):
    try:
        if ctx and getattr(self.responseandstreamthrows, "pass_context", False):
            result = await self.responseandstreamthrows(ctx,
                      foo)
        else:
            result = await self.responseandstreamthrows(
                      foo)
    except _module_types.FooEx as ex:
        promise.cPromise.setException(deref((<_module_types.FooEx> ex)._cpp_obj))
    except __ApplicationError as ex:
        # If the handler raised an ApplicationError convert it to a C++ one
        promise.cPromise.setException(cTApplicationException(
            ex.type.value, ex.message.encode('UTF-8')
        ))
    except Exception as ex:
        print(
            "Unexpected error in service handler responseandstreamthrows:",
            file=sys.stderr)
        traceback.print_exc()
        promise.cPromise.setException(cTApplicationException(
            cTApplicationExceptionType__UNKNOWN, repr(ex).encode('UTF-8')
        ))
    else:
        promise.cPromise.setValue(cResponseAndServerStream[cint32_t,cint32_t]() # server streaming support is not implemented yet
)

