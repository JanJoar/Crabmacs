(use-modules 
	(gnu)
	(gnu packages emacs)
	(gnu packages version-control)
	)
(operating-system
	(host-name "kudu-inst")
	(timezone "Europe/Stockholm")
	(locale "en_US.utf8")

	(bootloader (bootloader-configuration
		(bootloader grub-bootloader)
		(targets '("$DISK"))))

	(kernel-arguments (list "console=ttyS0,115200"))
	(file-systems (cons* (file-system
		(mount-point "/")
		(device (uuid
			"$ROOT_UUID"
			'ext4))
	(type "ext4")) %base-file-systems))
	(users %base-user-accounts)
	(packages (append (list git emacs) %base-packages))
	(services %base-services)