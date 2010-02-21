;;; ogre-material-mode.el --- mode for editing OGRE3D .material files


(provide 'ogre-material-mode)

(eval-when-compile
  (require 'cc-mode))


(defconst ogre-material-version "0.1"
  "version")


(defvar ogre-material-mode-hook nil
  "lolz ogre")


(add-to-list 'auto-mode-alist '("\\.material\\'" . ogre-material-mode))




(let* (;; section names
       (ogre-material-section-names
        (eval-when-compile
          (regexp-opt '("material" "vertex_program" "fragment_program"
                        "vertex_program_ref" "fragment_program_ref"
                        "pass" "technique" "texture_unit" "defaults_params"

                        ))))
       
       ;; technique section attrs
       (ogre-material-technique-attrs
        (eval-when-compile '("scheme" "lod_index"
                             "shadow_caster_material" "shadow_receiver_material"
                             "gpu_vendor_rule" "gpu_device_rule")))

       ;; pass section attrs
       (ogre-material-pass-attrs
        (eval-when-compile
          (regexp-opt '("ambient" "diffuse" "specular" "emissive"
                        "scene_blend"  "separate_scene_blend"  "scene_blend_op" 
                        "separate_scene_blend_op"  "depth_check"  "depth_write" 
                        "depth_func"  "depth_bias"  "iteration_depth_bias" 
                        "alpha_rejection"  "alpha_to_coverage"  "light_scissor" 
                        "light_clip_planes"  "illumination_stage"  "transparent_sorting" 
                        "normalise_normals"  "cull_hardware"  "cull_software" 
                        "lighting"  "shading"  "polygon_mode" 
                        "polygon_mode_overrideable"  "fog_override"  "colour_write" 
                        "max_lights"  "start_light"  "iteration" 
                        "point_size"  "point_sprites"  "point_size_attenuation" 
                        "point_size_min"  "point_size_max"))))

       ;; texture_unit section attrs
       (ogre-material-texture-unit-attrs
        (eval-when-compile
          (regexp-opt '("texture_alias" "texture"))))

       ;; shader declaration attrs
       (ogre-material-shader-attrs
        (eval-when-compile
          (regexp-opt '("source" "entry_point" "profiles"))))

       ;; shader default_params section
       (ogre-material-default-params
        (eval-when-compile
          (regexp-opt '("param_named" "param_named_auto"))))

       ;; ogre special values for shader uniforms
       (ogre-material-derived-value-names
        (eval-when-compile
          (regexp-opt '("world_matrix" "view_matrix"))))

       (ogre-material-parameter-types
        (eval-when-compile
          (regexp-opt '("float" "float4"))))
       )
  
  
 
  (setq ogre-material-font-lock-keywords-1
        (list
         `(eval . 
                (cons (concat "\\<\\(" ,ogre-material-section-names "\\)\\>")
                      'font-lock-type-face ))

         `(eval .
                (cons (concat "\\<\\(" ,ogre-material-pass-attrs "\\)\\>")
                      'font-lock-builtin-face))
                
         `(eval .
                (cons (concat "\\<\\(" ,ogre-material-shader-attrs "\\)\\>" )
                      'font-lock-builtin-face))

         )))
     

;;(defconst ogre-material-font-lock-keywords-1
;;  (list
;;   '("\\(?:fragment_program\\|material\\|vertex_program\\)" . font-lock-type-face)
;; 
;;  ))


(defvar ogre-material-font-lock-keywords ogre-material-font-lock-keywords-1)

(defvar ogre-material-mode-syntax-table
  (let ((ogre-material-mode-syntax-table (make-syntax-table)))
  ogre-material-mode-syntax-table)
  "OGRE3D material syntax table")
  

(define-derived-mode ogre-material-mode text-mode "material"
  "Major mode for editing OGRE3D .material files."
  (set (make-local-variable 'font-lock-defaults) '(ogre-material-font-lock-keywords))
  )




