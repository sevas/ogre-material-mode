;;; ogre-material-mode.el --- mode for editing OGRE3D .material files


(provide 'ogre-material-mode)

(eval-when-compile
  (require 'cc-mode))


(defconst ogre-material-version "0.1"
  "version")


(defvar ogre-material-mode-hook nil
  "lolz ogre")


(add-to-list 'auto-mode-alist '("\\.material\\'" . ogre-material-mode))




;;(let* ((ogre-material-keywords
;;        (eval-when-compile
;;          (regexp-opt '("material" "vertex_program" "fragment_program"
;;                        "default_params" "param_named" "param_named_auto"
;;                        "source" "entry_point" "profiles" "technique"
;;                        "pass"))))
;;       (ogre-material-type-specs
;;        (eval-when-compile
;;          (regexp-opt '("float" "float2" "float3" "float4"))))
;;       (ogre-material-type-specs-depth
;;        (regexp-opt-depth ogre-material-type-specs)))
;; 
;;  (setq ogre-material-font-lock-keywords-1
;;        nil)
;;         
;; 
;;  )
       

(defconst ogre-material-font-lock-keywords-1
  (list
   '("\\(?:fragment_program\\|material\\|vertex_program\\)" . font-lock-type-face)

  ))


(defvar ogre-material-font-lock-keywords ogre-material-font-lock-keywords-1)

(defvar ogre-material-mode-syntax-table
  (let ((ogre-material-mode-syntax-table (make-syntax-table)))
  ogre-material-mode-syntax-table)
  "syntax table")
  

(define-derived-mode ogre-material-mode c-mode "material"
  "Major mode for editing OGRE3D .material files."
  (set (make-local-variable 'font-lock-defaults) '(ogre-material-font-lock-keywords))
  )




