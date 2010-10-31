" Vim syntax file
" Language:	Sphinx sphinx.conf mmseg.conf
" Version:	0.99
syn clear

syn match   sphinxComment  "^\s*#.*$"
syn keyword sphinxDataSource	type sql_host sql_port sql_user
syn keyword sphinxDataSource	sql_pass sql_db sql_sock
syn keyword sphinxDataSource	mysql_connect_flags odbc_dsn
syn keyword sphinxDataSource	mysql_ssl_cert mysql_ssl_key
syn keyword sphinxDataSource	mysql_ssl_ca
syn keyword sphinxDataSource	sql_query_pre sql_query sql_query_range
syn keyword sphinxDataSource	sql_range_step query_killlist
syn keyword sphinxDataSource	sql_attr_uint sql_attr_bool
syn keyword sphinxDataSource	sql_attr_bigint sql_attr_timestamp
syn keyword sphinxDataSource	sql_attr_str2ordinal sql_attr_float
syn keyword sphinxDataSource	sql_attr_multi
syn keyword sphinxDataSource	sql_query_post sql_query_post_index
syn keyword sphinxDataSource	sql_ranged_throttle sql_query_info
syn keyword sphinxDataSource	xmlpipe_command xmlpipe_field
syn keyword sphinxDataSource	xmlpipe_attr_uint xmlpipe_attr_bool
syn keyword sphinxDataSource	xmlpipe_attr_timestamp xmlpipe_attr_float
syn keyword sphinxDataSource	xmlpipe_attr_str2ordinal xmlpipe_attr_multi
syn keyword sphinxDataSource	xmlpipe_attr_float xmlpipe_fixup_utf8
syn keyword sphinxDataSource	mssql_winauth mssql_unicode unpack_zlib
syn keyword sphinxDataSource	unpack_mysqlcompress
syn keyword sphinxDataSource	unpck_mysqlcompress_maxsize
syn keyword sphinxIndex source path docinfo mlock morphology
syn keyword sphinxIndex min_stemming_len stopwords wordforms exceptions
syn keyword sphinxIndex min_word_len charset_type charset_dictpath
syn keyword sphinxIndex charset_table ignore_chars min_prefix_len
syn keyword sphinxIndex min_infix_len prefix_fields infix_fields
syn keyword sphinxIndex enable_star ngram_len ngram_chars
syn keyword sphinxIndex phrase_boundary phrase_boundary_step
syn keyword sphinxIndex html_strip html_index_attrs html_remove_elements
syn keyword sphinxIndex local agent agent_blackhole agent_connect_timeout
syn keyword sphinxIndex agent_query_timeout preopen ondisk_dict
syn keyword sphinxIndex inplace_enable inplace_hit_gap inplace_docinfo_gap
syn keyword sphinxIndex inplace_reloc_factor inplace_write_factor
syn keyword sphinxIndex index_exact_words overshort_step stopword_step
syn keyword sphinxIndexer mem_limit max_iops max_iosize max_xmlpipe2_field
syn keyword sphinxIndexer write_buffer
syn keyword sphinxSearchd listen address port log query_log read_timeout
syn keyword sphinxSearchd client_timeout max_children pid_file max_matches
syn keyword sphinxSearchd seamless_rotate preopen_indexes unlink_old
syn keyword sphinxSearchd attr_flush_period ondisk_dict_default
syn keyword sphinxSearchd max_packet_size mva_updates_pool crash_log_path
syn keyword sphinxSearchd max_filters max_filter_values listen_backlog
syn keyword sphinxSearchd read_buffer read_unhinted
syn keyword sphinxTypeWord  source index indexer searchd
syn match sphinxString "=.*$"
syn match sphinxString "^[^=]*\\$"

if !exists("did_sphinx_syntax_inits")
    let did_sphinx_syntax_inits = 1

    hi link sphinxDataSource	Function
    hi link sphinxIndex 	Number
    hi link sphinxComment	Comment
    hi link sphinxIndexer	Label
    hi link sphinxSearchd	Label
    hi link sphinxString	String
    hi link sphinxTypeWord	Include
"    hi link sphinxallowDenyVal      Special
endif
let b:current_syntax = "sphinx"
