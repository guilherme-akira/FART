#ifndef _FART_H_
#define _FART_H_

typedef enum fart_err_e
{
    FART_ERR_NO_ERROR,

    // Processing arguments on program call
    FART_ERR_NOT_ENOUGH_ARGUMENTS,
    FART_ERR_TOO_MUCH_ARGUMENTS,
    FART_ERR_INVALID_ARGUMENT,
    FART_ERR_NOT_ENOUGH_ARGUMENTS,

    _FART_ERR_NUMBER_OF_ERRORS
} fart_err_t;


#endif // _FART_H_