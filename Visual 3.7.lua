-- Загружаем библиотеку Visual UI
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/stalerstalera-source/VisualUI/main/Visual-UI.LUA"))()

-- ОБЯЗАТЕЛЬНЫЕ настройки
getgenv().namehub = "Visual UI"  -- название хаба
getgenv().Keycode_Enabled = false  -- false = Ctrl, true = RightCtrl

-- Ждем загрузки
task.wait(0.5)

-- Создаем UI
local TabsApi = Library.__init()

-- Создаем вкладку
local MainTab = TabsApi.create_tab("Основное")

-- Добавляем элементы на левую сторону
MainTab.create_title({
    section = 'left',
    name = 'Основные настройки'
})

MainTab.create_toggle({
    section = 'left',
    name = 'Включить скрипт',
    flag = 'enabled',
    enabled = false,
    callback = function(v)
        print("Скрипт:", v and "ВКЛЮЧЕН" or "ВЫКЛЮЧЕН")
    end
})

MainTab.create_slider({
    section = 'left',
    name = 'Скорость ходьбы',
    flag = 'walkspeed',
    minimum_value = 16,
    maximum_value = 100,
    value = 16,
    callback = function(v)
        game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = v
    end
})

-- Добавляем элементы на правую сторону
MainTab.create_button({
    section = 'right',
    name = 'Телепорт на спавн',
    callback = function()
        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(0, 10, 0))
    end
})

-- Информация в консоль
print("====================================")
print("Visual UI загружен!")
print("Нажмите Ctrl для открытия меню")
print("Название:", getgenv().namehub)
print("====================================")