#include "app_usbd_dummy.h"

void app_error_handler_bare(uint32_t error_code)
{
}

int main()
{
    app_usbd_class_inst_t inst;
    app_usbd_complex_evt_t evt;
    app_usbd_dummy_class_methods.event_handler(&inst, &evt);
    return 0;
}