#
# Autogenerated by Thrift
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#  @generated
#

from cpython.ref cimport PyObject
from libc.stdint cimport int8_t, int16_t, int32_t, int64_t
from libcpp cimport bool as cbool
from libcpp.map cimport map as cmap, pair as cpair
from libcpp.memory cimport shared_ptr, unique_ptr
from libcpp.set cimport set as cset
from libcpp.string cimport string
from libcpp.vector cimport vector

from folly cimport cFollyFuture, cFollyTry, cFollyUnit

cimport module.types


cdef extern from "src/gen-cpp2/SimpleService.h" namespace "py3::simple":
  cdef cppclass cSimpleServiceAsyncClient "py3::simple::SimpleServiceAsyncClient":
      pass

cdef extern from "<utility>" namespace "std":
  cdef unique_ptr[cSimpleServiceClientWrapper] move(unique_ptr[cSimpleServiceClientWrapper])

cdef extern from "src/gen-cpp2/DerivedService.h" namespace "py3::simple":
  cdef cppclass cDerivedServiceAsyncClient "py3::simple::DerivedServiceAsyncClient":
      pass

cdef extern from "<utility>" namespace "std":
  cdef unique_ptr[cDerivedServiceClientWrapper] move(unique_ptr[cDerivedServiceClientWrapper])

cdef extern from "src/gen-cpp2/RederivedService.h" namespace "py3::simple":
  cdef cppclass cRederivedServiceAsyncClient "py3::simple::RederivedServiceAsyncClient":
      pass

cdef extern from "<utility>" namespace "std":
  cdef unique_ptr[cRederivedServiceClientWrapper] move(unique_ptr[cRederivedServiceClientWrapper])

cdef extern from "src/gen-py3/module/clients_wrapper.h" namespace "py3::simple":
  cdef cppclass cSimpleServiceClientWrapper "py3::simple::SimpleServiceClientWrapper":
    cSimpleServiceClientWrapper(
      shared_ptr[cSimpleServiceAsyncClient] async_client)
    cFollyFuture[cFollyUnit] disconnect()
    cFollyFuture[int32_t] get_five()
    cFollyFuture[int32_t] add_five(
      int32_t arg_num,)
    cFollyFuture[cFollyUnit] do_nothing()
    cFollyFuture[string] concat(
      string arg_first,
      string arg_second,)
    cFollyFuture[int32_t] get_value(
      module.types.cSimpleStruct arg_simple_struct,)
    cFollyFuture[cbool] negate(
      cbool arg_input,)
    cFollyFuture[int8_t] tiny(
      int8_t arg_input,)
    cFollyFuture[int16_t] small(
      int16_t arg_input,)
    cFollyFuture[int64_t] big(
      int64_t arg_input,)
    cFollyFuture[double] two(
      double arg_input,)
    cFollyFuture[cFollyUnit] expected_exception()
    cFollyFuture[int32_t] unexpected_exception()
    cFollyFuture[int32_t] sum_i16_list(
      vector[int16_t] arg_numbers,)
    cFollyFuture[int32_t] sum_i32_list(
      vector[int32_t] arg_numbers,)
    cFollyFuture[int32_t] sum_i64_list(
      vector[int64_t] arg_numbers,)
    cFollyFuture[string] concat_many(
      vector[string] arg_words,)
    cFollyFuture[int32_t] count_structs(
      vector[module.types.cSimpleStruct] arg_items,)
    cFollyFuture[int32_t] sum_set(
      cset[int32_t] arg_numbers,)
    cFollyFuture[cbool] contains_word(
      cset[string] arg_words,
      string arg_word,)
    cFollyFuture[string] get_map_value(
      cmap[string,string] arg_words,
      string arg_key,)
    cFollyFuture[int16_t] map_length(
      cmap[string,module.types.cSimpleStruct] arg_items,)
    cFollyFuture[int16_t] sum_map_values(
      cmap[string,int16_t] arg_items,)
    cFollyFuture[int32_t] complex_sum_i32(
      module.types.cComplexStruct arg_counter,)
    cFollyFuture[string] repeat_name(
      module.types.cComplexStruct arg_counter,)
    cFollyFuture[module.types.cSimpleStruct] get_struct()
    cFollyFuture[vector[int32_t]] fib(
      int16_t arg_n,)
    cFollyFuture[cset[string]] unique_words(
      vector[string] arg_words,)
    cFollyFuture[cmap[string,int16_t]] words_count(
      vector[string] arg_words,)
    cFollyFuture[module.types.cAnEnum] set_enum(
      module.types.cAnEnum arg_in_enum,)
    cFollyFuture[vector[vector[int32_t]]] list_of_lists(
      int16_t arg_num_lists,
      int16_t arg_num_items,)
    cFollyFuture[cmap[string,cmap[string,int32_t]]] word_character_frequency(
      string arg_sentence,)
    cFollyFuture[vector[cset[string]]] list_of_sets(
      string arg_some_words,)
    cFollyFuture[int32_t] nested_map_argument(
      cmap[string,vector[module.types.cSimpleStruct]] arg_struct_map,)
    cFollyFuture[string] make_sentence(
      vector[vector[string]] arg_word_chars,)
    cFollyFuture[cset[int32_t]] get_union(
      vector[cset[int32_t]] arg_sets,)
    cFollyFuture[cset[string]] get_keys(
      vector[cmap[string,string]] arg_string_map,)
    cFollyFuture[double] lookup_double(
      int32_t arg_key,)
    cFollyFuture[string] retrieve_binary(
      string arg_something,)
    cFollyFuture[cset[string]] contain_binary(
      vector[string] arg_binaries,)
    cFollyFuture[vector[module.types.cAnEnum]] contain_enum(
      vector[module.types.cAnEnum] arg_the_enum,)


  cdef cppclass cDerivedServiceClientWrapper "py3::simple::DerivedServiceClientWrapper"(module.clients_wrapper.cSimpleServiceClientWrapper):
    cDerivedServiceClientWrapper(
      shared_ptr[cDerivedServiceAsyncClient] async_client)
    cFollyFuture[int32_t] get_six()


  cdef cppclass cRederivedServiceClientWrapper "py3::simple::RederivedServiceClientWrapper"(module.clients_wrapper.cDerivedServiceClientWrapper):
    cRederivedServiceClientWrapper(
      shared_ptr[cRederivedServiceAsyncClient] async_client)
    cFollyFuture[int32_t] get_seven()

