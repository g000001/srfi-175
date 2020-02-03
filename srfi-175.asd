;;;; srfi-175.asd

(cl:in-package :asdf)


(defsystem :srfi-175
  :version "20200204"
  :description "SRFI 175 for CL: ASCII character library"
  :long-description "SRFI 175 for CL: ASCII character library
https://srfi.schemers.org/srfi-175"
  :author "Lassi Kortela"
  :maintainer "CHIBA Masaomi"
  :license "MIT"
  :serial t
  :depends-on (:rnrs-compat :named-readtables :srfi-6)
  :components ((:file "package")
               (:file "utils")
               (:file "srfi-175")))


(defmethod perform :after ((o load-op) (c (eql (find-system :srfi-175))))
  (let ((name "https://github.com/g000001/srfi-175")
        (nickname :srfi-175))
    (if (and (find-package nickname)
             (not (eq (find-package nickname)
                      (find-package name))))
        (warn "~A: A package with name ~A already exists." name nickname)
        (rename-package name name `(,nickname)))))


(defsystem :srfi-175.test
  :version "20200204"
  :author "Lassi Kortela"
  :maintainer "CHIBA Masaomi"
  :license "MIT"
  :serial t
  :depends-on (:srfi-175)
  :components ((:file "tests")))


(defmethod perform ((o test-op) (c (eql (find-system :srfi-175.test))))
  (or (zerop
       (symbol-value
        (find-symbol
         (string '#:*fails*)
         "https://github.com/g000001/srfi-175#internals")))
      (error "test-op failed") ))


;;; *EOF*


