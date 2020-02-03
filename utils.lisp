(cl:in-package "https://github.com/g000001/srfi-175#internals")
(in-readtable :rnrs)

(define (call-with-port port proc)
  (let ((res (_proc port)))
    (cl:close port)
    res))

(define (bytevector? x)
  (cl:typep x '(cl:vector (cl:unsigned-byte 8))))

(define (bytevector-length x)
  (cl:length x))

(define (bytevector-u8-ref x i)
  (cl:aref x i))

(define (exact-integer? x)
  (cl:integerp x))

(define (string->utf8 x)
  (cl:map '(cl:vector (cl:unsigned-byte 8))
          #'cl:char-code
          x))
