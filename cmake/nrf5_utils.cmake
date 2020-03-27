# MIT License

# Copyright (c) 2019 Polidea

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

function(nrf5_validate_target target)
  set(supported_targets nrf52810 nrf52832 nrf52840)
  string(TOLOWER ${target} target_lower)
  list(FIND supported_targets ${target_lower} index)

  if(index EQUAL -1)
    message(FATAL_ERROR "Invalid target: ${target}")
  endif()
endfunction()

function(nrf5_get_mdk_postfix out_postfix target)
  if(target STREQUAL "nrf52810")
    set(${out_postfix} "nrf52810" PARENT_SCOPE)
  elseif(target STREQUAL "nrf52832")
    set(${out_postfix} "nrf52" PARENT_SCOPE)
  elseif(target STREQUAL "nrf52840")
    set(${out_postfix} "nrf52840" PARENT_SCOPE)
  else()
    message(FATAL_ERROR "Invalid target passed to nrf5_target_system_postfix() function")
  endif()
endfunction()

function(nrf5_get_device_name out_device_name target)
  # There are two nRF52832 SoC variants available with varying Flash and RAM sizes. Currently, only XXAA variant is supported.
  if(target STREQUAL "nrf52832")
    message(WARNING "nRF52832 target specified. nRF52832_XXAA variant assumed (512kB Flash / 64kB RAM).")
  endif()

  string(TOUPPER ${target} target_upper)
  set(${out_device_name} "${target_upper}_XXAA" PARENT_SCOPE)
endfunction()
