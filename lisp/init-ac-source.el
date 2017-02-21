;; add ac-sources for latex mode
(require-package 'ac-math)
(require 'ac-math)
(add-to-list 'ac-modes 'latex-mode)
(defun ac-latex-mode-setup ()
  (setq ac-sources
        (append '(ac-source-math-unicode ac-source-math-latex ac-source-latex-commands)
                ac-sources))
  )
(add-hook 'latex-mode-hook 'ac-latex-mode-setup)
(add-hook 'LaTeX-mode-hook 'ac-latex-mode-setup)

;; add ac-source for clang
(require-package 'auto-complete-clang)
(require 'auto-complete-clang)
(setq ac-clang-flags
      (append '("-std=c++11")
              (mapcar (lambda (item) (concat "-I" item))
                      (split-string
                       "
 /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../include/c++/v1
 /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../lib/clang/7.3.0/include
 /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include
 /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.11.sdk/usr/include
 /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.11.sdk/System/Library/Frameworks (framework directory)
"
                       ))))
(defun my-ac-cc-mode-setup ()
  (setq ac-sources (append '(ac-source-clang) ac-sources)))
(add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)

(provide 'init-ac-source)
