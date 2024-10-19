

(use-package mu4e
  :ensure nil
  :defer 5
  :config

  ;; refresh mbsync every 10 minutes
  (setq mu4e-update-interval (* 10 60))
  (setq mu4e-get-mail-command "mbsync -a")
  (setq mu4e-maildir "~/Mail/Emma")
  ;; use pass to store passwords
  ;; file auth looks for is ~/.password-store/<smtp.host.tld>:<port>/<name>
  (auth-source-pass-enable)
  (setq auth-sources '(password-store))
  (setq auth-source-debug t)
  (setq auth-source-do-cache nil)
  ;; no reply to self
  (setq mu4e-compose-dont-reply-to-self t)
  (setq mu4e-compose-keep-self-cc nil)
  ;; moving messages renames files to avoid errors
  (setq mu4e-change-filenames-when-moving t)
  ;; Configure the function to use for sending mail
  (setq message-send-mail-function 'smtpmail-send-it)
  ;; Display options
  (setq mu4e-view-show-images t)
  (setq mu4e-view-show-addresses 't)
  ;; Composing mail
  (setq mu4e-compose-dont-reply-to-self t)
  ;; don't keep message buffers around
  (setq message-kill-buffer-on-exit t)
  ;; Don't ask for a 'context' upon opening mu4e
  (setq mu4e-context-policy 'pick-first)
  ;; Don't ask to quit... why is this the default?
  (setq mu4e-confirm-quit nil)

  ;; Set up contexts for email accounts
  (setq mu4e-contexts
        (list
         (make-mu4e-context
          :name "Emma"
          :match-func
      (lambda (msg)
            (when msg
              (string-prefix-p "/Emma" (mu4e-message-field msg :maildir))))
          :vars `((user-mail-address . "eemmaa@waifu.club")
                  (user-full-name    . "Emma M.")
		  (smtpmail-starttls-credentials . (("mail.cock.li" 587 nil nil)))
                  (smtpmail-smtp-server  . "mail.cock.li")
                  (smtpmail-smtp-service . 587)
                  (smtpmail-smtp-user . "eemmaa@waifu.club")
                  (mu4e-compose-signature . "
-Emma
-----BEGIN PGP PUBLIC KEY BLOCK-----

mDMEZwfqYhYJKwYBBAHaRw8BAQdAlsr0YckwRldPF9R7L1NNy4TI8Jmu3+np6twh
WR72j/a0GEVtbWEgPGVlbW1hYUB3YWlmdS5jbHViPoiTBBMWCgA7FiEEL4WqNLS9
u7/8VSckYH5xtU/E+OAFAmcH6mICGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcC
F4AACgkQYH5xtU/E+OAa3wD/apbcd+eM8MsfXc8Ng6AdF3tXnygpRC2x1BIrNV2O
at8BAIpPjDJXVhdIONfyeXWDzFM26uY4WyTtOHIa+jmS2wcDuDgEZwfqYhIKKwYB
BAGXVQEFAQEHQHzuFk6DrdtVF46635UX4FTRVFe8KapBZwOXHVhAyVk0AwEIB4h4
BBgWCgAgFiEEL4WqNLS9u7/8VSckYH5xtU/E+OAFAmcH6mICGwwACgkQYH5xtU/E
+ODaxgEAyPHuYMuDV1agqbMKn3iafo/ifJYCd5BkOQ9QrJ62VMkA/AmKwQ3kIKIO
JqnMOXc2+GtLiM2pDeq6YmlQMOkUeToEmDMEZxAtlxYJKwYBBAHaRw8BAQdA6PwD
RMYyPDd1HFf1NLsVRPqkif/aUk/im3CDcoButyC0GGR4bSA8ZHhtQG1hc3RvZG9u
LndvcmxkPohyBBMWCAAaBAsJCAcCFQgCFgECGQEFgmcQLZcCngECmwMACgkQBlrr
twmvOFNlRQEAsJ3qCLL5drWJRkrCuGUi3Au951U9rxVp7+iscP6xgBcBAN0ammGj
2Cg/xRX15lAWh1OCsk1Gs9H6Cg8TCpxx5McNuDgEZxAtlxIKKwYBBAGXVQEFAQEH
QOgqNkQmXZ+1bmoaw/pPpc/Q2ElMGEUpIQctn8rFqKhAAwEIB4hhBBgWCAAJBYJn
EC2XApsMAAoJEAZa67cJrzhTxR0BAMwV7YlhTb/Yq31X2YXoSVD+t62Mbne6XDzM
jjzntuT1AP9a4F9u4Ds6RgPxJOU60wFxEPROSz7rC9QZszoLrUX7Dg==
=BYLI
-----END PGP PUBLIC KEY BLOCK-----")
                  (mu4e-drafts-folder  . "/Drafts")
                  (mu4e-sent-folder  . "/Sent")
                  (mu4e-refile-folder  . "/Archive")
                  (mu4e-trash-folder  . "/Trash")))))

  (setq m/mu4e-inbox-query
        "(maildir:/Inbox) AND flag:unread")
  (defun m/go-to-inbox ()
    (interactive)
    (mu4e-headers-search m/mu4e-inbox-query))
  ;; start mu4e
  (mu4e t))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(use-package mu4e)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
