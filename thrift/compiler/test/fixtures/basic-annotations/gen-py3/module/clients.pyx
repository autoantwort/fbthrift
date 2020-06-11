#
# Autogenerated by Thrift
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#  @generated
#
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
from libcpp.vector cimport vector as vector
from libcpp.set cimport set as cset
from libcpp.map cimport map as cmap
from cython.operator cimport dereference as deref, typeid
from cpython.ref cimport PyObject
from thrift.py3.client cimport cRequestChannel_ptr, makeClientWrapper, cClientWrapper
from thrift.py3.exceptions cimport try_make_shared_exception, create_py_exception
from folly cimport cFollyTry, cFollyUnit, c_unit
from folly.cast cimport down_cast_ptr
from libcpp.typeinfo cimport type_info
import thrift.py3.types
cimport thrift.py3.types
from thrift.py3.types cimport move
import thrift.py3.client
cimport thrift.py3.client
from thrift.py3.common cimport RpcOptions as __RpcOptions
from thrift.py3.reflection cimport (
    ArgumentSpec as __ArgumentSpec,
    InterfaceSpec as __InterfaceSpec,
    MethodSpec as __MethodSpec,
    NumberType as __NumberType
)

from folly.futures cimport bridgeFutureWith
from folly.executor cimport get_executor
cimport folly.iobuf as __iobuf
import folly.iobuf as __iobuf
from folly.iobuf cimport move as move_iobuf
cimport cython

import sys
import types as _py_types
from asyncio import get_event_loop as asyncio_get_event_loop, shield as asyncio_shield, InvalidStateError as asyncio_InvalidStateError

cimport module.types as _module_types
import module.types as _module_types

from module.clients_wrapper cimport cMyServiceAsyncClient, cMyServiceClientWrapper
from module.clients_wrapper cimport cMyServicePrioParentAsyncClient, cMyServicePrioParentClientWrapper
from module.clients_wrapper cimport cMyServicePrioChildAsyncClient, cMyServicePrioChildClientWrapper


cdef void MyService_ping_callback(
    cFollyTry[cFollyUnit]&& result,
    PyObject* userdata
):
    client, pyfuture, options = <object> userdata  
    if result.hasException():
        pyfuture.set_exception(create_py_exception(result.exception(), <__RpcOptions>options))
    else:
        try:
            pyfuture.set_result(None)
        except Exception as ex:
            pyfuture.set_exception(ex.with_traceback(None))

cdef void MyService_getRandomData_callback(
    cFollyTry[string]&& result,
    PyObject* userdata
):
    client, pyfuture, options = <object> userdata  
    if result.hasException():
        pyfuture.set_exception(create_py_exception(result.exception(), <__RpcOptions>options))
    else:
        try:
            pyfuture.set_result(result.value().data().decode('UTF-8'))
        except Exception as ex:
            pyfuture.set_exception(ex.with_traceback(None))

cdef void MyService_hasDataById_callback(
    cFollyTry[cbool]&& result,
    PyObject* userdata
):
    client, pyfuture, options = <object> userdata  
    if result.hasException():
        pyfuture.set_exception(create_py_exception(result.exception(), <__RpcOptions>options))
    else:
        try:
            pyfuture.set_result(<bint>result.value())
        except Exception as ex:
            pyfuture.set_exception(ex.with_traceback(None))

cdef void MyService_getDataById_callback(
    cFollyTry[string]&& result,
    PyObject* userdata
):
    client, pyfuture, options = <object> userdata  
    if result.hasException():
        pyfuture.set_exception(create_py_exception(result.exception(), <__RpcOptions>options))
    else:
        try:
            pyfuture.set_result(result.value().data().decode('UTF-8'))
        except Exception as ex:
            pyfuture.set_exception(ex.with_traceback(None))

cdef void MyService_putDataById_callback(
    cFollyTry[cFollyUnit]&& result,
    PyObject* userdata
):
    client, pyfuture, options = <object> userdata  
    if result.hasException():
        pyfuture.set_exception(create_py_exception(result.exception(), <__RpcOptions>options))
    else:
        try:
            pyfuture.set_result(None)
        except Exception as ex:
            pyfuture.set_exception(ex.with_traceback(None))

cdef void MyService_lobDataById_callback(
    cFollyTry[cFollyUnit]&& result,
    PyObject* userdata
):
    client, pyfuture, options = <object> userdata  
    if result.hasException():
        pyfuture.set_exception(create_py_exception(result.exception(), <__RpcOptions>options))
    else:
        try:
            pyfuture.set_result(None)
        except Exception as ex:
            pyfuture.set_exception(ex.with_traceback(None))

cdef void MyService_doNothing_callback(
    cFollyTry[cFollyUnit]&& result,
    PyObject* userdata
):
    client, pyfuture, options = <object> userdata  
    if result.hasException():
        pyfuture.set_exception(create_py_exception(result.exception(), <__RpcOptions>options))
    else:
        try:
            pyfuture.set_result(None)
        except Exception as ex:
            pyfuture.set_exception(ex.with_traceback(None))

cdef void MyServicePrioParent_ping_callback(
    cFollyTry[cFollyUnit]&& result,
    PyObject* userdata
):
    client, pyfuture, options = <object> userdata  
    if result.hasException():
        pyfuture.set_exception(create_py_exception(result.exception(), <__RpcOptions>options))
    else:
        try:
            pyfuture.set_result(None)
        except Exception as ex:
            pyfuture.set_exception(ex.with_traceback(None))

cdef void MyServicePrioParent_pong_callback(
    cFollyTry[cFollyUnit]&& result,
    PyObject* userdata
):
    client, pyfuture, options = <object> userdata  
    if result.hasException():
        pyfuture.set_exception(create_py_exception(result.exception(), <__RpcOptions>options))
    else:
        try:
            pyfuture.set_result(None)
        except Exception as ex:
            pyfuture.set_exception(ex.with_traceback(None))

cdef void MyServicePrioChild_pang_callback(
    cFollyTry[cFollyUnit]&& result,
    PyObject* userdata
):
    client, pyfuture, options = <object> userdata  
    if result.hasException():
        pyfuture.set_exception(create_py_exception(result.exception(), <__RpcOptions>options))
    else:
        try:
            pyfuture.set_result(None)
        except Exception as ex:
            pyfuture.set_exception(ex.with_traceback(None))


cdef object _MyService_annotations = _py_types.MappingProxyType({
})


@cython.auto_pickle(False)
cdef class MyService(thrift.py3.client.Client):
    annotations = _MyService_annotations

    cdef const type_info* _typeid(MyService self):
        return &typeid(cMyServiceAsyncClient)

    cdef bind_client(MyService self, cRequestChannel_ptr&& channel):
        self._client = makeClientWrapper[cMyServiceAsyncClient, cMyServiceClientWrapper](
            thrift.py3.client.move(channel)
        )

    @cython.always_allow_keywords(True)
    def ping(
            MyService self,
            __RpcOptions rpc_options=None
    ):
        if rpc_options is None:
            rpc_options = <__RpcOptions>__RpcOptions.__new__(__RpcOptions)
        self._check_connect_future()
        __loop = asyncio_get_event_loop()
        __future = __loop.create_future()
        __userdata = (self, __future, rpc_options)
        bridgeFutureWith[cFollyUnit](
            self._executor,
            down_cast_ptr[cMyServiceClientWrapper, cClientWrapper](self._client.get()).ping(rpc_options._cpp_obj, 
            ),
            MyService_ping_callback,
            <PyObject *> __userdata
        )
        return asyncio_shield(__future)

    @cython.always_allow_keywords(True)
    def getRandomData(
            MyService self,
            __RpcOptions rpc_options=None
    ):
        if rpc_options is None:
            rpc_options = <__RpcOptions>__RpcOptions.__new__(__RpcOptions)
        self._check_connect_future()
        __loop = asyncio_get_event_loop()
        __future = __loop.create_future()
        __userdata = (self, __future, rpc_options)
        bridgeFutureWith[string](
            self._executor,
            down_cast_ptr[cMyServiceClientWrapper, cClientWrapper](self._client.get()).getRandomData(rpc_options._cpp_obj, 
            ),
            MyService_getRandomData_callback,
            <PyObject *> __userdata
        )
        return asyncio_shield(__future)

    @cython.always_allow_keywords(True)
    def hasDataById(
            MyService self,
            id not None,
            __RpcOptions rpc_options=None
    ):
        if rpc_options is None:
            rpc_options = <__RpcOptions>__RpcOptions.__new__(__RpcOptions)
        if not isinstance(id, int):
            raise TypeError(f'id is not a {int !r}.')
        else:
            id = <cint64_t> id
        self._check_connect_future()
        __loop = asyncio_get_event_loop()
        __future = __loop.create_future()
        __userdata = (self, __future, rpc_options)
        bridgeFutureWith[cbool](
            self._executor,
            down_cast_ptr[cMyServiceClientWrapper, cClientWrapper](self._client.get()).hasDataById(rpc_options._cpp_obj, 
                id,
            ),
            MyService_hasDataById_callback,
            <PyObject *> __userdata
        )
        return asyncio_shield(__future)

    @cython.always_allow_keywords(True)
    def getDataById(
            MyService self,
            id not None,
            __RpcOptions rpc_options=None
    ):
        if rpc_options is None:
            rpc_options = <__RpcOptions>__RpcOptions.__new__(__RpcOptions)
        if not isinstance(id, int):
            raise TypeError(f'id is not a {int !r}.')
        else:
            id = <cint64_t> id
        self._check_connect_future()
        __loop = asyncio_get_event_loop()
        __future = __loop.create_future()
        __userdata = (self, __future, rpc_options)
        bridgeFutureWith[string](
            self._executor,
            down_cast_ptr[cMyServiceClientWrapper, cClientWrapper](self._client.get()).getDataById(rpc_options._cpp_obj, 
                id,
            ),
            MyService_getDataById_callback,
            <PyObject *> __userdata
        )
        return asyncio_shield(__future)

    @cython.always_allow_keywords(True)
    def putDataById(
            MyService self,
            id not None,
            str data not None,
            __RpcOptions rpc_options=None
    ):
        if rpc_options is None:
            rpc_options = <__RpcOptions>__RpcOptions.__new__(__RpcOptions)
        if not isinstance(id, int):
            raise TypeError(f'id is not a {int !r}.')
        else:
            id = <cint64_t> id
        self._check_connect_future()
        __loop = asyncio_get_event_loop()
        __future = __loop.create_future()
        __userdata = (self, __future, rpc_options)
        bridgeFutureWith[cFollyUnit](
            self._executor,
            down_cast_ptr[cMyServiceClientWrapper, cClientWrapper](self._client.get()).putDataById(rpc_options._cpp_obj, 
                id,
                data.encode('UTF-8'),
            ),
            MyService_putDataById_callback,
            <PyObject *> __userdata
        )
        return asyncio_shield(__future)

    @cython.always_allow_keywords(True)
    def lobDataById(
            MyService self,
            id not None,
            str data not None,
            __RpcOptions rpc_options=None
    ):
        if rpc_options is None:
            rpc_options = <__RpcOptions>__RpcOptions.__new__(__RpcOptions)
        if not isinstance(id, int):
            raise TypeError(f'id is not a {int !r}.')
        else:
            id = <cint64_t> id
        self._check_connect_future()
        __loop = asyncio_get_event_loop()
        __future = __loop.create_future()
        __userdata = (self, __future, rpc_options)
        bridgeFutureWith[cFollyUnit](
            self._executor,
            down_cast_ptr[cMyServiceClientWrapper, cClientWrapper](self._client.get()).lobDataById(rpc_options._cpp_obj, 
                id,
                data.encode('UTF-8'),
            ),
            MyService_lobDataById_callback,
            <PyObject *> __userdata
        )
        return asyncio_shield(__future)

    @cython.always_allow_keywords(True)
    def doNothing(
            MyService self,
            __RpcOptions rpc_options=None
    ):
        if rpc_options is None:
            rpc_options = <__RpcOptions>__RpcOptions.__new__(__RpcOptions)
        self._check_connect_future()
        __loop = asyncio_get_event_loop()
        __future = __loop.create_future()
        __userdata = (self, __future, rpc_options)
        bridgeFutureWith[cFollyUnit](
            self._executor,
            down_cast_ptr[cMyServiceClientWrapper, cClientWrapper](self._client.get()).doNothing(rpc_options._cpp_obj, 
            ),
            MyService_doNothing_callback,
            <PyObject *> __userdata
        )
        return asyncio_shield(__future)


    @staticmethod
    def __get_reflection_for_ping():
        return __MethodSpec.create(
            name="ping",
            arguments=(
            ),
            result=None,
            result_kind=__NumberType.NOT_A_NUMBER,
            exceptions=(
            ),
            annotations={
            },
        )

    @staticmethod
    def __get_reflection_for_getRandomData():
        return __MethodSpec.create(
            name="getRandomData",
            arguments=(
            ),
            result=str,
            result_kind=__NumberType.NOT_A_NUMBER,
            exceptions=(
            ),
            annotations={
            },
        )

    @staticmethod
    def __get_reflection_for_hasDataById():
        return __MethodSpec.create(
            name="hasDataById",
            arguments=(
                __ArgumentSpec.create(
                    name="id",
                    type=int,
                    kind=__NumberType.I64,
                    annotations={
                    },
                ),
            ),
            result=bool,
            result_kind=__NumberType.NOT_A_NUMBER,
            exceptions=(
            ),
            annotations={
            },
        )

    @staticmethod
    def __get_reflection_for_getDataById():
        return __MethodSpec.create(
            name="getDataById",
            arguments=(
                __ArgumentSpec.create(
                    name="id",
                    type=int,
                    kind=__NumberType.I64,
                    annotations={
                    },
                ),
            ),
            result=str,
            result_kind=__NumberType.NOT_A_NUMBER,
            exceptions=(
            ),
            annotations={
            },
        )

    @staticmethod
    def __get_reflection_for_putDataById():
        return __MethodSpec.create(
            name="putDataById",
            arguments=(
                __ArgumentSpec.create(
                    name="id",
                    type=int,
                    kind=__NumberType.I64,
                    annotations={
                    },
                ),
                __ArgumentSpec.create(
                    name="data",
                    type=str,
                    kind=__NumberType.NOT_A_NUMBER,
                    annotations={
                    },
                ),
            ),
            result=None,
            result_kind=__NumberType.NOT_A_NUMBER,
            exceptions=(
            ),
            annotations={
            },
        )

    @staticmethod
    def __get_reflection_for_lobDataById():
        return __MethodSpec.create(
            name="lobDataById",
            arguments=(
                __ArgumentSpec.create(
                    name="id",
                    type=int,
                    kind=__NumberType.I64,
                    annotations={
                    },
                ),
                __ArgumentSpec.create(
                    name="data",
                    type=str,
                    kind=__NumberType.NOT_A_NUMBER,
                    annotations={
                    },
                ),
            ),
            result=None,
            result_kind=__NumberType.NOT_A_NUMBER,
            exceptions=(
            ),
            annotations={
            },
        )

    @staticmethod
    def __get_reflection_for_doNothing():
        return __MethodSpec.create(
            name="doNothing",
            arguments=(
            ),
            result=None,
            result_kind=__NumberType.NOT_A_NUMBER,
            exceptions=(
            ),
            annotations={
                """cpp.name""": """cppDoNothing""",
            },
        )

    @classmethod
    def __get_reflection__(cls):
        return __InterfaceSpec.create(
            name="MyService",
            methods=(
                cls.__get_reflection_for_ping(),
                cls.__get_reflection_for_getRandomData(),
                cls.__get_reflection_for_hasDataById(),
                cls.__get_reflection_for_getDataById(),
                cls.__get_reflection_for_putDataById(),
                cls.__get_reflection_for_lobDataById(),
                cls.__get_reflection_for_doNothing(),
            ),
            annotations={
            },
        )

cdef object _MyServicePrioParent_annotations = _py_types.MappingProxyType({
    """priority""": """HIGH""",
})


@cython.auto_pickle(False)
cdef class MyServicePrioParent(thrift.py3.client.Client):
    annotations = _MyServicePrioParent_annotations

    cdef const type_info* _typeid(MyServicePrioParent self):
        return &typeid(cMyServicePrioParentAsyncClient)

    cdef bind_client(MyServicePrioParent self, cRequestChannel_ptr&& channel):
        self._client = makeClientWrapper[cMyServicePrioParentAsyncClient, cMyServicePrioParentClientWrapper](
            thrift.py3.client.move(channel)
        )

    @cython.always_allow_keywords(True)
    def ping(
            MyServicePrioParent self,
            __RpcOptions rpc_options=None
    ):
        if rpc_options is None:
            rpc_options = <__RpcOptions>__RpcOptions.__new__(__RpcOptions)
        self._check_connect_future()
        __loop = asyncio_get_event_loop()
        __future = __loop.create_future()
        __userdata = (self, __future, rpc_options)
        bridgeFutureWith[cFollyUnit](
            self._executor,
            down_cast_ptr[cMyServicePrioParentClientWrapper, cClientWrapper](self._client.get()).ping(rpc_options._cpp_obj, 
            ),
            MyServicePrioParent_ping_callback,
            <PyObject *> __userdata
        )
        return asyncio_shield(__future)

    @cython.always_allow_keywords(True)
    def pong(
            MyServicePrioParent self,
            __RpcOptions rpc_options=None
    ):
        if rpc_options is None:
            rpc_options = <__RpcOptions>__RpcOptions.__new__(__RpcOptions)
        self._check_connect_future()
        __loop = asyncio_get_event_loop()
        __future = __loop.create_future()
        __userdata = (self, __future, rpc_options)
        bridgeFutureWith[cFollyUnit](
            self._executor,
            down_cast_ptr[cMyServicePrioParentClientWrapper, cClientWrapper](self._client.get()).pong(rpc_options._cpp_obj, 
            ),
            MyServicePrioParent_pong_callback,
            <PyObject *> __userdata
        )
        return asyncio_shield(__future)


    @staticmethod
    def __get_reflection_for_ping():
        return __MethodSpec.create(
            name="ping",
            arguments=(
            ),
            result=None,
            result_kind=__NumberType.NOT_A_NUMBER,
            exceptions=(
            ),
            annotations={
                """priority""": """IMPORTANT""",
            },
        )

    @staticmethod
    def __get_reflection_for_pong():
        return __MethodSpec.create(
            name="pong",
            arguments=(
            ),
            result=None,
            result_kind=__NumberType.NOT_A_NUMBER,
            exceptions=(
            ),
            annotations={
                """priority""": """HIGH_IMPORTANT""",
            },
        )

    @classmethod
    def __get_reflection__(cls):
        return __InterfaceSpec.create(
            name="MyServicePrioParent",
            methods=(
                cls.__get_reflection_for_ping(),
                cls.__get_reflection_for_pong(),
            ),
            annotations={
                """priority""": """HIGH""",
            },
        )

cdef object _MyServicePrioChild_annotations = _py_types.MappingProxyType({
})


@cython.auto_pickle(False)
cdef class MyServicePrioChild(MyServicePrioParent):
    annotations = _MyServicePrioChild_annotations

    cdef const type_info* _typeid(MyServicePrioChild self):
        return &typeid(cMyServicePrioChildAsyncClient)

    cdef bind_client(MyServicePrioChild self, cRequestChannel_ptr&& channel):
        self._client = makeClientWrapper[cMyServicePrioChildAsyncClient, cMyServicePrioChildClientWrapper](
            thrift.py3.client.move(channel)
        )

    @cython.always_allow_keywords(True)
    def pang(
            MyServicePrioChild self,
            __RpcOptions rpc_options=None
    ):
        if rpc_options is None:
            rpc_options = <__RpcOptions>__RpcOptions.__new__(__RpcOptions)
        self._check_connect_future()
        __loop = asyncio_get_event_loop()
        __future = __loop.create_future()
        __userdata = (self, __future, rpc_options)
        bridgeFutureWith[cFollyUnit](
            self._executor,
            down_cast_ptr[cMyServicePrioChildClientWrapper, cClientWrapper](self._client.get()).pang(rpc_options._cpp_obj, 
            ),
            MyServicePrioChild_pang_callback,
            <PyObject *> __userdata
        )
        return asyncio_shield(__future)


    @staticmethod
    def __get_reflection_for_pang():
        return __MethodSpec.create(
            name="pang",
            arguments=(
            ),
            result=None,
            result_kind=__NumberType.NOT_A_NUMBER,
            exceptions=(
            ),
            annotations={
                """priority""": """BEST_EFFORT""",
            },
        )

    @classmethod
    def __get_reflection__(cls):
        return __InterfaceSpec.create(
            name="MyServicePrioChild",
            methods=(
                cls.__get_reflection_for_pang(),
            ),
            annotations={
            },
        )

