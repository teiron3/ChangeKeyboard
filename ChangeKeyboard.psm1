function Change-Keyboard { 
	param(
		[switch]$jp,
		[switch]$en
	)
	begin {}
	end {
		if (-not ($jp -or $en)) {
			return
		}	
		[string]$Path = "HKLM:\SYSTEM\CurrentControlSet\services\i8042prt\Parameters"

		if ($jp) {
			#���{��z��@���W�X�g���ύX
			Set-ItemProperty -Path $Path -Name "LayerDriver JPN" -Value kbd106.dll
			Set-ItemProperty -Path $Path -Name "OverrideKeyboardIdentifier" -Value PCAT_106KEY
			Set-ItemProperty -Path $Path -Name "OverrideKeyboardType" -Value 7
			Set-ItemProperty -Path $Path -Name "OverrideKeyboardSubtype" -Value 2
		}
		if ($en) {
			#�p��z��@���W�X�g���ύX
			Set-ItemProperty -Path $Path -Name "LayerDriver JPN" -Value kbd101.dll
			Set-ItemProperty -Path $Path -Name "OverrideKeyboardIdentifier" -Value PCAT_101KEY
			Set-ItemProperty -Path $Path -Name "OverrideKeyboardType" -Value 7
			Set-ItemProperty -Path $Path -Name "OverrideKeyboardSubtype" -Value 0
		}
		write-host �h�T�C���A�E�g���T�C���C������Ɣ��f����܂��h
	}
}
