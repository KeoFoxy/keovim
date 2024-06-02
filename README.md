# Example_config

## Preview
<img src="./img/nvim1.png">

```lua
-- secrets.lua
local secrets = { WAKATIME_SECRET_API_KEY = "WAKATIME_SECRET_API_KEY" }
return secrets
```

## Commands

### Команды для LSP
`:LspInfo` — Показать информацию о текущем статусе LSP.  
`:LspStart <server>` — Запустить указанный LSP сервер.  
`:LspStop <server>` — Остановить указанный LSP сервер.  
`:LspRestart` — Перезапустить все активные LSP серверы.  

### Команды для автокомплита и LSP

`K` — Показать документацию для символа под курсором.  
`gd` — Перейти к определению символа.  
`gD` — Перейти к объявлению символа.  
`gi` — Перейти к реализации символа.  
`gr` — Найти все ссылки на символ.  
`gs` — Показать подсказку по сигнатуре функции.  
`gn` — Переименовать символ.  
`[g` — Перейти к предыдущей диагностике (ошибке/предупреждению).  
`g]` — Перейти к следующей диагностике (ошибке/предупреждению).  

### Команды для null-ls

`:lua vim.lsp.buf.formatting_sync()` — Применить автоформатирование для текущего файла.  
`:NullLsInfo` — Показать информацию о статусе null-ls.  
`:lua vim.lsp.buf.code_action()` — Выполнить действия кода (например, автофиксы).  

### Команды для nvim-tree

`<leader>e` — Открыть или закрыть NvimTree.  
`r` — Переименовать файл или директорию.  
`a` — Создать новый файл или директорию.  
`d` — Удалить файл или директорию.  
`x` — Вырезать файл или директорию.  
`c` — Скопировать файл или директорию.  
`p` — Вставить файл или директорию.  

### Команды для telescope

`<leader>ff` — Найти файл.  
`<leader>fg` — Найти текст в файлах (grep).  
`<leader>fb` — Найти буферы.  
`<leader>fh` — Найти справку.  

### Команды для работы с typescript-tools.nvim

`:TSToolsRenameFile` — Переименовать или переместить файл с автоматическим обновлением путей импортов.   
`:TSToolsOrganizeImports` — Организовать импорты в текущем файле.   
`:TSToolsAddMissingImports` — Добавить отсутствующие импорты в текущем файле.   
`:TSToolsRemoveUnused` — Удалить неиспользуемые переменные и импорты.   

### Команды для rust-tools.nvim

`:RustRunnables` — Показать список возможных запусков кода.  
`:RustExpandMacro` — Развернуть макрос под курсором.  
`:RustHoverActions` — Показать доступные действия под курсором.   
`:RustOpenCargo` — Открыть файл Cargo.toml.   

### Полезные комбинации клавиш   

`<leader>w` — Сохранить текущий файл.  
`<leader>q` — Закрыть текущий буфер.  
`<leader>c` — Комментировать/раскомментировать строку или выделение (с помощью плагина комментариев).   