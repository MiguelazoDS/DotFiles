layout src
set disassembly-flavor intel
set debuginfod enabled off
define jsontostring
   printf "%s\n", $arg0.dump(2, ' ', true, nlohmann::detail::error_handler_t::strict).c_str()
end
