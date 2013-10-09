# ололо! заголовок!

Здесь находится пример того, как можно хранить файлики - при переводе книжки **HPMOR**.  
Книга и её главы выложены в формате *markdown*.
- книга целиком `hpmor_ru.md`
- разборка по главам в папке `./parts/`.

> Чтобы не создавать путаницы - после того как авторы проекта посмотрят, как это может выглядеть - я выпилю этот репозиторий или подарю им.

## Скрипты

Написаны на **bat-posh** исполняются в Windows XP/Vista/7 - из коробки.

- `./book_split.bat` - разделяет книгу `./hpmor_ru.md` на главы и кладет в `./parts`.
- `./book_join.bat` - соединяет главы из `./parts` в книгу `./hpmor_ru_joined.md`.
- `./book_export.bat` - экспортирует книгу `./hpmor_ru.md` из формата *markdown* в **epub/fb2/html/docx** и т.д.
