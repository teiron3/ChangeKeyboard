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
			#日本語配列　レジストリ変更
			Set-ItemProperty -Path $Path -Name "LayerDriver JPN" -Value kbd106.dll
			Set-ItemProperty -Path $Path -Name "OverrideKeyboardIdentifier" -Value PCAT_106KEY
			Set-ItemProperty -Path $Path -Name "OverrideKeyboardType" -Value 7
			Set-ItemProperty -Path $Path -Name "OverrideKeyboardSubtype" -Value 2
		}
		if ($en) {
			#英語配列　レジストリ変更
			Set-ItemProperty -Path $Path -Name "LayerDriver JPN" -Value kbd101.dll
			Set-ItemProperty -Path $Path -Name "OverrideKeyboardIdentifier" -Value PCAT_101KEY
			Set-ItemProperty -Path $Path -Name "OverrideKeyboardType" -Value 7
			Set-ItemProperty -Path $Path -Name "OverrideKeyboardSubtype" -Value 0
		}
		write-host ”サインアウト→サインインすると反映されます”
	}
}
