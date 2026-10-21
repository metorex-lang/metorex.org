---
title: C Extensions
slug: c-extensions
description: Metorex loads C extensions written for MRI through the rb_* C API it exports, and has nkf's extension compiled in.
order: 6
aliases: [/c-extensions]
---

Metorex loads C extensions written for MRI. `require` of a `.bundle` or `.so` opens it and runs its `Init_` function, as MRI's does. An extension is compiled against the headers metorex ships under `include/`, which `RbConfig::CONFIG["rubyhdrdir"]` names, and `require "mkmf"` gives an `extconf.rb` the `create_makefile`, `have_header`, `have_library`, and `dir_config` it calls. A gem with C extensions has them built against those headers the first time it is activated.

## nkf

nkf, the Japanese text converter MRI ships as a bundled gem, is a C extension. Metorex compiles it into its binary, and `require "nkf"` starts it. This sample prints the same under Metorex and MRI:

```ruby
require "nkf"

greeting = "こんにちは、世界".encode("Shift_JIS")
p greeting.bytesize
p NKF.guess(greeting)
p NKF.nkf("-w", greeting)
p NKF.nkf("-w --hiragana", "カタカナ")
```

```
16
#<Encoding:Shift_JIS>
"こんにちは、世界"
"かたかな"
```

## The Functions Metorex Exports

`bin/c-api.raku` in this site's repository writes this list from the symbols the metorex binary exports.

<!-- c-api-functions start -->

569 functions.

**`rb_`**: `rb_Array`, `rb_Complex`, `rb_Float`, `rb_Hash`, `rb_Integer`, `rb_Rational`, `rb_String`, `rb_alias`, `rb_big2dbl`, `rb_big2ll`, `rb_big2long`, `rb_big2str`, `rb_big2ulong`, `rb_catch`, `rb_class2name`, `rb_cmperr`, `rb_cmpint`, `rb_cstr2inum`, `rb_dbl2big`, `rb_each`, `rb_ensure`, `rb_enumeratorize`, `rb_equal`, `rb_errinfo`, `rb_fix2int`, `rb_fix2uint`, `rb_funcallv`, `rb_gc`, `rb_hash`, `rb_id2name`, `rb_id2str`, `rb_id2sym`, `rb_inspect`, `rb_int2inum`, `rb_intern`, `rb_intern2`, `rb_intern3`, `rb_iterate`, `rb_ll2inum`, `rb_memcicmp`, `rb_num2char`, `rb_num2dbl`, `rb_num2int`, `rb_num2long`, `rb_num2short`, `rb_num2uint`, `rb_num2ulong`, `rb_path2class`, `rb_protect`, `rb_require`, `rb_rescue`, `rb_sourcefile`, `rb_sourceline`, `rb_str2inum`, `rb_sym2id`, `rb_sym2str`, `rb_throw`, `rb_type`, `rb_uint2inum`, `rb_ull2inum`, `rb_undef`, `rb_yield`

**`rb_ary_`**: `rb_ary_aref`, `rb_ary_cat`, `rb_ary_clear`, `rb_ary_concat`, `rb_ary_delete`, `rb_ary_delete_at`, `rb_ary_dup`, `rb_ary_entry`, `rb_ary_freeze`, `rb_ary_includes`, `rb_ary_join`, `rb_ary_new`, `rb_ary_new_capa`, `rb_ary_new_from_values`, `rb_ary_plus`, `rb_ary_pop`, `rb_ary_push`, `rb_ary_reverse`, `rb_ary_rotate`, `rb_ary_shift`, `rb_ary_sort`, `rb_ary_sort_bang`, `rb_ary_store`, `rb_ary_subseq`, `rb_ary_to_ary`, `rb_ary_to_s`, `rb_ary_unshift`

**`rb_block_`**: `rb_block_call`, `rb_block_given_p`, `rb_block_lambda`, `rb_block_proc`

**`rb_check_`**: `rb_check_array_type`, `rb_check_convert_type`, `rb_check_frozen`, `rb_check_funcall`, `rb_check_string_type`, `rb_check_symbol_cstr`, `rb_check_to_integer`, `rb_check_type`, `rb_check_typeddata`

**`rb_class_`**: `rb_class_get_superclass`, `rb_class_inherited_p`, `rb_class_instance_methods`, `rb_class_name`, `rb_class_new`, `rb_class_new_instance`, `rb_class_new_instance_kw`, `rb_class_of`, `rb_class_path`, `rb_class_private_instance_methods`, `rb_class_protected_instance_methods`, `rb_class_public_instance_methods`, `rb_class_real`, `rb_class_superclass`

**`rb_const_`**: `rb_const_defined`, `rb_const_defined_at`, `rb_const_get`, `rb_const_get_at`, `rb_const_get_from`, `rb_const_set`

**`rb_data_`**: `rb_data_object_wrap`, `rb_data_object_zalloc`, `rb_data_typed_object_wrap`, `rb_data_typed_object_zalloc`

**`rb_debug_`**: `rb_debug_inspector_backtrace_locations`, `rb_debug_inspector_current_depth`, `rb_debug_inspector_frame_binding_get`, `rb_debug_inspector_frame_class_get`, `rb_debug_inspector_frame_depth`, `rb_debug_inspector_frame_iseq_get`, `rb_debug_inspector_frame_self_get`, `rb_debug_inspector_open`

**`rb_define_`**: `rb_define_alias`, `rb_define_alloc_func`, `rb_define_attr`, `rb_define_class`, `rb_define_class_id_under`, `rb_define_class_under`, `rb_define_class_variable`, `rb_define_const`, `rb_define_dummy_encoding`, `rb_define_finalizer`, `rb_define_global_const`, `rb_define_global_function`, `rb_define_hooked_variable`, `rb_define_method`, `rb_define_module`, `rb_define_module_function`, `rb_define_module_under`, `rb_define_private_method`, `rb_define_protected_method`, `rb_define_readonly_variable`, `rb_define_singleton_method`, `rb_define_variable`, `rb_define_virtual_variable`

**`rb_enc_`**: `rb_enc_alias`, `rb_enc_associate`, `rb_enc_associate_index`, `rb_enc_check`, `rb_enc_codelen`, `rb_enc_codepoint_len`, `rb_enc_compatible`, `rb_enc_copy`, `rb_enc_dummy_p`, `rb_enc_find`, `rb_enc_find_index`, `rb_enc_from_encoding`, `rb_enc_from_index`, `rb_enc_get`, `rb_enc_get_index`, `rb_enc_interned_str`, `rb_enc_interned_str_cstr`, `rb_enc_isalnum`, `rb_enc_isspace`, `rb_enc_left_char_head`, `rb_enc_mbc_to_codepoint`, `rb_enc_mbcput`, `rb_enc_nth`, `rb_enc_precise_mbclen`, `rb_enc_set_index`, `rb_enc_str_asciionly_p`, `rb_enc_str_buf_cat`, `rb_enc_str_coderange`, `rb_enc_str_new`, `rb_enc_str_new_cstr`, `rb_enc_str_new_static`, `rb_enc_strlen`, `rb_enc_to_index`

**`rb_exc_`**: `rb_exc_new`, `rb_exc_new_cstr`, `rb_exc_new_str`, `rb_exc_raise`

**`rb_fiber_`**: `rb_fiber_alive_p`, `rb_fiber_current`, `rb_fiber_new`, `rb_fiber_raise`, `rb_fiber_resume`, `rb_fiber_transfer`, `rb_fiber_yield`

**`rb_gc_`**: `rb_gc_adjust_memory_usage`, `rb_gc_count`, `rb_gc_disable`, `rb_gc_enable`, `rb_gc_latest_gc_info`, `rb_gc_location`, `rb_gc_mark`, `rb_gc_mark_locations`, `rb_gc_mark_maybe`, `rb_gc_mark_movable`, `rb_gc_register_address`, `rb_gc_register_mark_object`, `rb_gc_start`, `rb_gc_unregister_address`

**`rb_hash_`**: `rb_hash_aref`, `rb_hash_aset`, `rb_hash_bulk_insert`, `rb_hash_clear`, `rb_hash_delete`, `rb_hash_delete_if`, `rb_hash_dup`, `rb_hash_end`, `rb_hash_fetch`, `rb_hash_foreach`, `rb_hash_freeze`, `rb_hash_lookup`, `rb_hash_lookup2`, `rb_hash_new`, `rb_hash_new_capa`, `rb_hash_set_ifnone`, `rb_hash_size`, `rb_hash_start`, `rb_hash_uint`, `rb_hash_uint32`

**`rb_io_`**: `rb_io_addstr`, `rb_io_binmode`, `rb_io_check_closed`, `rb_io_check_io`, `rb_io_check_readable`, `rb_io_check_writable`, `rb_io_close`, `rb_io_closed_p`, `rb_io_descriptor`, `rb_io_get_io`, `rb_io_maybe_wait`, `rb_io_maybe_wait_readable`, `rb_io_maybe_wait_writable`, `rb_io_mode`, `rb_io_open_descriptor`, `rb_io_path`, `rb_io_print`, `rb_io_printf`, `rb_io_puts`, `rb_io_set_nonblock`, `rb_io_taint_check`, `rb_io_wait`, `rb_io_write`

**`rb_iseq_`**: `rb_iseq_code_location`, `rb_iseq_parameters`, `rb_iseq_realpath`, `rb_iseq_type`

**`rb_ivar_`**: `rb_ivar_count`, `rb_ivar_defined`, `rb_ivar_foreach`, `rb_ivar_get`, `rb_ivar_set`

**`rb_locale_`**: `rb_locale_encindex`, `rb_locale_encoding`, `rb_locale_str_new`, `rb_locale_str_new_cstr`

**`rb_mutex_`**: `rb_mutex_lock`, `rb_mutex_locked_p`, `rb_mutex_new`, `rb_mutex_sleep`, `rb_mutex_synchronize`, `rb_mutex_trylock`, `rb_mutex_unlock`

**`rb_num_`**: `rb_num_coerce_bin`, `rb_num_coerce_cmp`, `rb_num_coerce_relop`, `rb_num_zerodiv`

**`rb_obj_`**: `rb_obj_alloc`, `rb_obj_as_string`, `rb_obj_call_init`, `rb_obj_class`, `rb_obj_classname`, `rb_obj_dup`, `rb_obj_encoding`, `rb_obj_freeze`, `rb_obj_frozen_p`, `rb_obj_id`, `rb_obj_instance_eval`, `rb_obj_instance_variables`, `rb_obj_is_instance_of`, `rb_obj_is_kind_of`, `rb_obj_is_proc`, `rb_obj_memsize_of`, `rb_obj_method`, `rb_obj_method_arity`, `rb_obj_respond_to`, `rb_obj_reveal`

**`rb_proc_`**: `rb_proc_arity`, `rb_proc_call`, `rb_proc_call_kw`, `rb_proc_call_with_block`, `rb_proc_call_with_block_kw`, `rb_proc_new`

**`rb_reg_`**: `rb_reg_match`, `rb_reg_new`, `rb_reg_nth_match`, `rb_reg_options`, `rb_reg_regcomp`

**`rb_set_`**: `rb_set_add`, `rb_set_clear`, `rb_set_delete`, `rb_set_end_proc`, `rb_set_errinfo`, `rb_set_foreach`, `rb_set_lookup`, `rb_set_new`, `rb_set_new_capa`, `rb_set_size`

**`rb_st_`**: `rb_st_add_direct`, `rb_st_clear`, `rb_st_delete`, `rb_st_foreach`, `rb_st_free_table`, `rb_st_init_numtable`, `rb_st_init_numtable_with_size`, `rb_st_init_strcasetable`, `rb_st_init_strcasetable_with_size`, `rb_st_init_strtable`, `rb_st_init_strtable_with_size`, `rb_st_init_table`, `rb_st_init_table_with_size`, `rb_st_insert`, `rb_st_lookup`, `rb_st_table_size`

**`rb_str_`**: `rb_str_append`, `rb_str_buf_append`, `rb_str_buf_cat`, `rb_str_buf_new`, `rb_str_buf_new_cstr`, `rb_str_capacity`, `rb_str_cat`, `rb_str_cat_cstr`, `rb_str_cmp`, `rb_str_conv_enc`, `rb_str_conv_enc_opts`, `rb_str_drop_bytes`, `rb_str_dup`, `rb_str_encode`, `rb_str_equal`, `rb_str_export`, `rb_str_export_locale`, `rb_str_export_to_enc`, `rb_str_format`, `rb_str_free`, `rb_str_freeze`, `rb_str_hash`, `rb_str_inspect`, `rb_str_intern`, `rb_str_length`, `rb_str_locktmp`, `rb_str_modify`, `rb_str_modify_expand`, `rb_str_new`, `rb_str_new_cstr`, `rb_str_new_frozen`, `rb_str_new_shared`, `rb_str_new_with_class`, `rb_str_plus`, `rb_str_resize`, `rb_str_set_len`, `rb_str_split`, `rb_str_strlen`, `rb_str_sublen`, `rb_str_subpos`, `rb_str_subseq`, `rb_str_substr`, `rb_str_times`, `rb_str_tmp_new`, `rb_str_to_interned_str`, `rb_str_to_str`, `rb_str_unlocktmp`, `rb_str_update`

**`rb_struct_`**: `rb_struct_aref`, `rb_struct_aset`, `rb_struct_getmember`, `rb_struct_initialize`, `rb_struct_members`, `rb_struct_s_members`, `rb_struct_size`

**`rb_syserr_`**: `rb_syserr_fail`, `rb_syserr_fail_str`, `rb_syserr_new`, `rb_syserr_new_str`

**`rb_thread_`**: `rb_thread_alone`, `rb_thread_call_without_gvl`, `rb_thread_create`, `rb_thread_current`, `rb_thread_fd_select`, `rb_thread_fd_writable`, `rb_thread_local_aref`, `rb_thread_local_aset`, `rb_thread_wait_fd`, `rb_thread_wait_for`, `rb_thread_wakeup`

**`rb_time_`**: `rb_time_interval`, `rb_time_nano_new`, `rb_time_new`, `rb_time_num_new`, `rb_time_timespec`, `rb_time_timespec_new`, `rb_time_timeval`

**`rb_to_`**: `rb_to_encoding`, `rb_to_encoding_index`, `rb_to_id`, `rb_to_int`, `rb_to_symbol`

**`rb_tracepoint_`**: `rb_tracepoint_disable`, `rb_tracepoint_enable`, `rb_tracepoint_enabled_p`, `rb_tracepoint_new`

**`rb_usascii_`**: `rb_usascii_encindex`, `rb_usascii_encoding`, `rb_usascii_str_new`, `rb_usascii_str_new_cstr`, `rb_usascii_str_new_static`

**`rb_utf8_`**: `rb_utf8_encindex`, `rb_utf8_encoding`, `rb_utf8_str_new`, `rb_utf8_str_new_cstr`, `rb_utf8_str_new_static`

**`ruby_`**: `ruby_native_thread_p`, `ruby_strtod`, `ruby_thread_has_gvl_p`, `ruby_vm_at_exit`

**Other**: `rb_absint_singlebit_p`, `rb_absint_size`, `rb_any_to_s`, `rb_arithmetic_sequence_beg_len_step`, `rb_arithmetic_sequence_extract`, `rb_ascii8bit_encindex`, `rb_ascii8bit_encoding`, `rb_assoc_new`, `rb_attr_get`, `rb_backref_get`, `rb_backref_set`, `rb_big_cmp`, `rb_big_pack`, `rb_big_sign`, `rb_call_super`, `rb_call_super_kw`, `rb_catch_obj`, `rb_cloexec_dup`, `rb_cloexec_fcntl_dupfd`, `rb_cloexec_open`, `rb_complex_new`, `rb_convert_type`, `rb_copy_generic_ivar`, `rb_cstr_to_inum`, `rb_cv_get`, `rb_cv_set`, `rb_cvar_defined`, `rb_cvar_get`, `rb_cvar_set`, `rb_default_external_encoding`, `rb_default_internal_encoding`, `rb_deprecate_constant`, `rb_digest_namespace`, `rb_enumeratorize_with_size`, `rb_error_arity`, `rb_error_frozen_object`, `rb_eval_string`, `rb_eval_string_protect`, `rb_exec_recursive`, `rb_extend_object`, `rb_external_str_new`, `rb_external_str_new_cstr`, `rb_external_str_new_with_enc`, `rb_f_global_variables`, `rb_f_notimplement`, `rb_f_sprintf`, `rb_fd_fix_cloexec`, `rb_file_open`, `rb_file_open_str`, `rb_filesystem_encindex`, `rb_filesystem_encoding`, `rb_float_new`, `rb_float_type_p`, `rb_float_value`, `rb_frame_this_func`, `rb_free_generic_ivar`, `rb_funcall_with_block`, `rb_funcall_with_block_kw`, `rb_funcallv_kw`, `rb_funcallv_public`, `rb_get_alloc_func`, `rb_get_kwargs`, `rb_get_path`, `rb_global_variable`, `rb_gv_get`, `rb_gv_set`, `rb_ident_hash_new`, `rb_include_module`, `rb_int_positive_pow`, `rb_integer_pack`, `rb_intern_str`, `rb_interned_str`, `rb_interned_str_cstr`, `rb_is_class_id`, `rb_is_const_id`, `rb_is_instance_id`, `rb_iseqw_new`, `rb_iseqw_to_iseq`, `rb_iter_break`, `rb_iter_break_value`, `rb_iv_get`, `rb_iv_set`, `rb_jump_tag`, `rb_keyword_given_p`, `rb_lastline_get`, `rb_lastline_set`, `rb_make_backtrace`, `rb_make_exception`, `rb_marshal_dump`, `rb_marshal_load`, `rb_mem_clear`, `rb_method_boundp`, `rb_mod_ancestors`, `rb_mod_name`, `rb_need_block`, `rb_nkf_enc_get`, `rb_objspace_each_objects`, `rb_out_of_int`, `rb_path_to_class`, `rb_prepend_module`, `rb_range_beg_len`, `rb_range_new`, `rb_range_values`, `rb_rarray_len`, `rb_rarray_ptr`, `rb_rational_den`, `rb_rational_new`, `rb_rational_num`, `rb_respond_to`, `rb_rstring_len`, `rb_rstring_ptr`, `rb_scan_args_bad_format`, `rb_singleton_class`, `rb_special_const_p`, `rb_string_value`, `rb_string_value_cstr`, `rb_string_value_ptr`, `rb_symbol_p`, `rb_sys_fail`, `rb_throw_obj`, `rb_timespec_now`, `rb_typeddata_inherited_p`, `rb_typeddata_is_kind_of`, `rb_undef_alloc_func`, `rb_undef_method`, `rb_undefine_finalizer`, `rb_uv_to_utf8`, `rb_warn_message`, `rb_yield_splat`, `rb_yield_values2`

<!-- c-api-functions end -->
