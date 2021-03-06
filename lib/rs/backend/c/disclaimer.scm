#|
/********************************* NOTICE *********************************
 **                                                                      **
 **   This file was automatically generated by the RScheme system,       **
 **   and may be automatically re-generated when the compiler or         **
 **   source changes, or the system is re-built.                         **
 **                                                                      **
 **   THEREFORE, DO NOT MODIFY THIS FILE MANUALLY, AS ANY CHANGES WILL   **
 **   SURELY BE LOST!                                                    **
 **                                                                      **
 **************************************************************************/
|#

(define (in-box port header lines)
  ;;
  (define (mid str)
    (display " **" port)
    (display str port)
    (display (make-string (- 70 (string-length str)) #\space) port)
    (display "**" port)
    (newline port))
  ;;
  ;; top row
  (write-char #\/ port)
  (let ((n (- 70 (string-length header))))
    (display "**" port)
    (display (make-string (quotient n 2) #\*) port)
    (display header port)
    (display (make-string (quotient (+ n 1) 2) #\*) port)
    (display "**" port)
    (newline port))
  ;;
  (for-each mid lines)
  ;; bottom row
  (write-char #\space port)
  (display (make-string 74 #\*) port)
  (write-char #\/ port)
  (newline port)
  (newline port))

(define (display-disclaimer owner p)
  (in-box
   p
   "****************************** NOTICE ***********************-*-C-*-"
  ;;
   `(""
     "   This file was automatically generated by the RScheme system,"
     "   and may be automatically re-generated when the compiler or"
     "   source changes, or the system is re-built."
     ""
     "   THEREFORE, DO NOT MODIFY THIS FILE MANUALLY, AS ANY CHANGES WILL"
     "   SURELY BE LOST!"
     ""
     ,@(if (get-property owner 'build-id #f)
	   (list (format #f "   RScheme build (~a)" 
			 (get-property owner 'build-id))
		 "")
	   '()))))
