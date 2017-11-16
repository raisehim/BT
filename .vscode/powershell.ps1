if( $args.length -eq 0 ){ # 바로 터미널 진입시 git integrated shell을 연다
    powershell -noexit -ExecutionPolicy Unrestricted "& './.vscode/kokomo.ps1'"
}
else { # Task 등을 실행하는 경우

    $tmp, $argsOthers = $args

    if( $argsOthers -eq "node_modules\.bin\grunt.cmd" ) { # Grunt 인자가 쪼개져서 들어오는 현상 때문에 1개로 합침
        $gruntCmd, $gruntArgs = $argsOthers
        Invoke-Expression "$($gruntCmd) '$($gruntArgs -join ' ')'"
    }
    else {
        Invoke-Expression "$argsOthers -join ' '"
    }

}
