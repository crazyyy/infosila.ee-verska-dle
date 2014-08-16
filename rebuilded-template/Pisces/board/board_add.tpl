<script type="text/javascript"> 
(function() { // Все, что требуется, выполняется внутри анонимной функции
    // По окончании загрузки документа вызвать функцию init()
    if (window.addEventListener) 
        window.addEventListener("load", init, false);
    else if (window.attachEvent) 
        window.attachEvent("onload", init);

    // Устанавливает обработчики событий для форм и элементов форм,
    // где это необходимо
    function init() {
        // Цикл по всем формам в документе
        for(var i = 0; i < document.forms.length; i++) {
            var f = document.forms[i];  // текущая форма

            // Предположить, что форма не требует проверки
            var needsValidation = false;

            // Цикл по всем элементам текущей формы
            for(j = 0; j < f.elements.length; j++) {
                var e = f.elements[j];  // текущий элемент

                // Интерес представляют только поля <input type="text">
                if (e.type != "text") continue;

                // Проверить, имеются ли атрибуты, требующие проверки
                var pattern = e.getAttribute("pattern");
                // Можно было бы использовать e.hasAttribute()
                // но MS IE не поддерживает его
                var required = e.getAttribute("required") != null;

                // Атрибут required - это лишь краткая форма записи
                // атрибута pattern
                if (required && !pattern) {
                    pattern = "\\S";
                    e.setAttribute("pattern", pattern);
                }

                // Если элемент требует проверки,
                if (pattern) {
                    // проверять при каждом изменении содержимого элемента
                    e.onchange = validateOnChange;
                    // Запомнить, чтобы потом добавить обработчик onsubmit
                    needsValidation = true;
                }
            }

            // Если хотя бы один элемент формы требует проверки,
            // то необходимо установить обработчик события onsubmit формы
            if (needsValidation) f.onsubmit = validateOnSubmit;
        }
    }
          
    // Эта функция - обработчик события onchange для текстового поля, которое
    // требует проверки. Не забывайте, что в функции init() мы преобразовали
    // атрибут required в pattern
    function validateOnChange() {
        var textfield = this;                            // текстовое поле
        var pattern = textfield.getAttribute("pattern"); // шаблон
        var value = this.value;                          // данные, введенные пользователем

        // Если значение не соответствует шаблону, установить
        // значение атрибута сдфыы равным "invalid"
        if (value.search(pattern) == -1) textfield.className = "invalid";
        else textfield.className = "valid";
    }

    // Эта функция - обработчик события onsubmit для любой формы,
    // требующей проверки
    function validateOnSubmit() {
        // Перед отправкой формы выполнить проверку всех полей в форме
        // и установить их свойства className в соответствующее значение.
        // Если хотя бы одно из этих полей содержит ошибку, вывести диалоговое
        // окно и заблокировать отправку данных формы.
        var invalid = false;  // Предполагаем, что все правильно
        // Цикл по всем элементам формы
        for(var i = 0; i < this.elements.length; i++) {
            var e = this.elements[i];
            // Если элемент - это текстовое поле, для которого установлен
            // наш обработчик события onchange
            if (e.type == "text" && e.onchange == validateOnChange) {
                e.onchange(); // Вызвать обработчик для повторной проверки
                // Если проверка не пройдена - значит вся форма не прошла проверку
                if (e.className == "invalid") invalid = true;
            }
        }

        // Если форма не прошла проверку, вывести диалоговое окно
        // и заблокировать отправку формы
        if (invalid) {
            alert("Форма заполнена не полностью или были введены некорректные данные.\n" +
                  "Пожалуйста, проверьте правильность выделенных полей и повторите попытку.");
            return false;
        }
    }
})();
</script>
<style type="text/css">
input.invalid { background: #faa } /* Красноватый фон для полей с ошибками */
input.valid { background: #afa } /* Зеленовытый фон для полей, заполненных правильно */
</style>

              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="10" align="left" valign="top"><img src="{THEME}/images/dlet_artblock_11.gif" width="10" height="8" /></td>
                  <td align="left" valign="top" class="a_block_12"><img src="{THEME}/images/spacer.gif" width="1" height="8" /></td>
                  <td width="10" align="right" valign="top"><img src="{THEME}/images/dlet_artblock_13.gif" width="10" height="8" /></td>
                </tr>
                <tr>
                  <td width="10" align="left" valign="top"><img src="{THEME}/images/dlet_artblock_21.gif" width="10" height="23" /></td>
                  <td align="left" valign="top" class="a_block_22"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="17" align="left" valign="top"><img src="{THEME}/images/dlet_artblock_22_01.gif" width="17" height="23" /></td>
                        <td align="left" class="ntitle">{title}</td>
                        <td width="17" align="right" valign="top"><img src="{THEME}/images/dlet_artblock_22_03.gif" width="17" height="23" /></td>
                      </tr>
                    </table></td>
                  <td width="10" align="right" valign="top"><img src="{THEME}/images/dlet_artblock_23.gif" width="10" height="23" /></td>
                </tr>
                <tr>
                  <td width="10" align="left" valign="top"><img src="{THEME}/images/dlet_artblock_31.gif" width="10" height="9" /></td>
                  <td align="left" valign="top" class="a_block_32"><img src="{THEME}/images/spacer.gif" width="1" height="9" /></td>
                  <td width="10" align="right" valign="top"><img src="{THEME}/images/dlet_artblock_33.gif" width="10" height="9" /></td>
                </tr>
                <tr>
                  <td width="10" align="left" valign="top" class="a_block_61">&nbsp;</td>
                  <td align="left" valign="top" class="slink"><br />
 <!-- START BOARD FORM Если нужны обязательные для заполнения поля ставим required или патерн с нужной маской-->
<form  method="post" enctype="multipart/form-data" name="board-comments-form" id="board-comments-form" action="/index.php?do=board">
                    <table width="500" border="0" cellspacing="0" cellpadding="0" align="center">

                      <tr>
                        <td width="140" height="25">Категория:</td>
                        <td width="360"><select onchange="window.open(this.options[this.selectedIndex].value,'_top')">{selectcat}</select></td>
                      </tr>
					  
					                        <tr>
                        <td width="140" height="25">Подкатегорию:</td>
                        <td width="360"><select name="scat_id">{selectsubcat}</select></td>
                      </tr>
[not-logged]
                      <tr>
                        <td width="140" height="25" align="left">Ваше Имя:</td>
                        <td width="360"><input type="text" name="autor" class="f_input" required/></td>
                      </tr>
[/not-logged]
					                        <tr>
                        <td width="140" height="25">Название объявления:</td>
                        <td width="360"><input type="text" name="name" class="f_input" required/></td>
                      </tr>
					                        <tr>
                        <td width="140" height="25">Стоимость:</td>
                        <td width="360"><input type="text" name="price" class="f_input" required/></td>
                      </tr>
					                        <tr>
                        <td width="140" height="25">Валюта:</td>
                        <td width="360"><select name="money">{selectmoney}</select></td>
                      </tr>
					                        <tr>
                        <td width="140" height="25">Телефон:</td>
                        <td width="360"><input type="text" name="tel" class="f_input" /></td>
                      </tr>
					                        <tr>
                        <td width="140" height="25">E-Mail:</td>
                        <td width="360"><input type="text" name="mail" class="f_input" value="{email}" pattern="^\s*\w+@\w+\.\w+\s*" /></td>
                      </tr>
					  
	
					<tr>
                        <td width="140" height="25">Фото для превью:</td>
                        <td width="360"><input type="file" name="foto_0" /></td>
                      </tr>
					 <tr>
                        <td width="140" height="25">Доп. фото №1:</td>
                        <td width="360"><input type="file" name="foto_1" /></td>
                      </tr>
					 <tr>
                        <td width="140" height="25">Доп. фото №2:</td>
                        <td width="360"><input type="file" name="foto_2" /></td>
                      </tr>
					  

                      <tr>
                        <td colspan="2">{bbcode}</td>
                      </tr>
                      <tr>
                        <td colspan="2"><textarea name="text" id="comments" class="f_textarea" onclick="setNewField(this.name, document.getElementById( 'board-comments-form' ))" />{text}</textarea><br /></td>

                      </tr>
[sec_code]
                      <tr>
                        <td width="140">Код:</td>
                        <td width="360"><br />{sec_code}</td>
                      </tr>
                      <tr>
                        <td width="140" height="35">Введите код:</td>
                        <td width="360"><input type="text" name="sec_code" id="sec_code" style="width:115px" class="f_input" /></td>
                      </tr>
[/sec_code]
                      <tr>
                        <td colspan="2"><br />
						{hide}
						<input type="submit" name="submit" value="Отправить"><input type="hidden" name="addboard" value="ok" />
                        </td>
                      </tr>
                    </table>
</form><!-- END BOARD FORM -->
                  </td>
                  <td width="10" align="right" valign="top" class="a_block_63">&nbsp;</td>
                </tr>
                <tr>
                  <td width="10" align="left" valign="top"><img src="{THEME}/images/dlet_artblock_71.gif" width="10" height="7" /></td>
                  <td align="left" valign="top" class="a_block_72"><img src="{THEME}/images/spacer.gif" width="1" height="7" /></td>
                  <td width="10" align="right" valign="top"><img src="{THEME}/images/dlet_artblock_73.gif" width="10" height="7" /></td>
                </tr>
                <tr>
                  <td width="10" align="left" valign="top"><img src="{THEME}/images/dlet_artblock_81.gif" width="10" height="14" /></td>
                  <td align="left" valign="top" class="a_block_82">&nbsp;</td>
                  <td width="10" align="right" valign="top"><img src="{THEME}/images/dlet_artblock_83.gif" width="10" height="14" /></td>
                </tr>
              </table>
              <br />