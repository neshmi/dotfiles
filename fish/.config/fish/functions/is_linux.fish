function is_linux
    if test (uname) = "Linux"
        return 0
    else
        return 1
    end
end