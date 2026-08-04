{
  pkgs,
  ...
}:
{
  programs = {
    dconf.enable = true;
    seahorse.enable = true;
    hyprlock.enable = true; # Resolve pam issue, can be disabled per-host via enableHyprlock
    fuse.userAllowOther = true;
    mtr.enable = true;
    nix-ld.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  # Virtualization support for GNOME Boxes
  virtualisation.libvirtd.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # ==================== СИСТЕМНЫЕ ИНСТРУМЕНТЫ ====================
    # Диагностика и информация о системе
    fastfetch # Красивый вывод информации о системе
    inxi # Детальная информация о железе и системе
    lshw # Полная информация об аппаратном обеспечении
    nitch # Минималистичный fetch-скрипт
    lm_sensors # Мониторинг температуры и датчиков
    pciutils # Просмотр PCI-устройств (видеокарты, сеть)
    usbutils # Информация о USB-устройствах

    # Управление системой
    brightnessctl # Управление яркостью экрана
    pavucontrol # Графическое управление звуком PulseAudio
    alsa-utils # Управление звуком ALSA
    killall # Завершение процессов по имени
    libnotify # Отправка системных уведомлений
    playerctl # Управление медиаплеерами через CLI
    socat # Сетевой мультиплексор для потоков данных

    # Файловая система и диски
    duf # Красивый аналог df с цветным выводом
    dysk # Древовидный анализ дискового пространства
    gdu # Интерактивный визуальный анализ дисков
    ncdu # Анализатор дисков на базе ncurses
    file-roller # Графический архиватор
    unrar # Распаковка RAR архивов
    unzip # Распаковка ZIP архивов
    p7zip # Мощный архиватор 7-Zip

    # Терминальные утилиты
    eza # Улучшенная замена ls с иконками
    fd # Быстрый поиск файлов вместо find
    ripgrep # Быстрый поиск текста вместо grep
    dig # DNS-запросы и диагностика сети
    gping # Визуализация пинга в реальном времени
    cmatrix # Матричный дождь в терминале
    cowsay # ASCII-корова с текстом
    lolcat # Радужная раскраска текста
    rich-cli # Форматированный вывод в терминале
    wget # Скачивание файлов из сети

    # ==================== РАЗРАБОТКА И ПРОГРАММИРОВАНИЕ ====================
    # Языки и сборка
    gnumake # Система сборки проектов
    pkg-config # Поиск библиотек для компиляции

    # ==================== ГРАФИЧЕСКИЕ ПРИЛОЖЕНИЯ ====================
    # Браузеры и файловые менеджеры
    kdePackages.dolphin # Файловый менеджер KDE
    eog # Просмотр изображений GNOME

    # Лаунчеры и управление окнами
    rofi-emoji # Поиск и вставка эмодзи через rofi
    hyprpicker # Пипетка для выбора цвета с экрана
    xwayland-satellite # XWayland отдельно от композитора

    # Мультимедиа
    kdePackages.kdenlive # Профессиональный видеоредактор
    mpv # Легкий и мощный видеоплеер
    rhythmbox # Музыкальный плеер для коллекций
    picard # Редактирование тегов музыки
    sox # Обработка звука в CLI
    ffmpeg # Работа с видео/аудио в CLI
    ytmdl # Скачивание аудио с YouTube
    motrix # Менеджер загрузок (HTTP/BT/Magnet)

    # Документы и офис
    kdePackages.okular # Универсальный просмотрщик документов
    onlyoffice-desktopeditors # Офисный пакет для документов и таблиц
    zathura

    # Коммуникации
    telegram-desktop # Мессенджер Telegram
    localsend # Передача файлов по локальной сети

    # Утилиты
    super-productivity # Трекер задач и Pomodoro
    jetbrains-toolbox # Управление IDE JetBrains
    popsicle # Создание загрузочных USB
    appimage-run # Запуск AppImage приложений

    # ==================== ИНСТРУМЕНТЫ АДМИНИСТРИРОВАНИЯ ====================
    ansible # Управление конфигурациями серверов
    docker-compose # Оркестрация многоконтейнерных приложений

    # ==================== ДОПОЛНИТЕЛЬНЫЕ УТИЛИТЫ ====================
    v4l-utils # Настройка веб-камер Video4Linux
    mesa-demos # Тестирование графики OpenGL
    onefetch # Информация о Git-репозитории
    gum # Стильные интерфейсы в Bash-скриптах
  ];
}
