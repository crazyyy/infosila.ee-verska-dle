                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="20" align="left" valign="top"><img src="{THEME}/images/dlet_abl01.gif" width="20" height="30" alt="" /></td>
                            <td align="left" valign="top" class="abl02"><table width="100%" border="0" cellpadding="0" cellspacing="0" class="abl121">
                                <tr>
                                  <td width="40" height="30"><img src="{THEME}/images/spacer.gif" width="40" height="1" alt="" /></td>
                                  <td align="left" class="ntitle">Добавление фирмы в каталог</td>
                                </tr>
                              </table></td>
                            <td width="20" align="right" valign="top"><img src="{THEME}/images/dlet_abl13.gif" width="20" height="30" alt="" /></td>
                          </tr>
                          <tr>
                            <td width="20" align="left" valign="top"><img src="{THEME}/images/dlet_abl51.gif" width="20" height="30" alt="" /></td>
                            <td align="left" valign="top" class="abl22"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td height="30" class="abl221"></td>
                                </tr>
                              </table></td>
                            <td width="20" align="right" valign="top"><img src="{THEME}/images/dlet_abl53.gif" width="20" height="30" alt="" /></td>
                          </tr>
                          <tr>
                            <td width="20" align="left" valign="top" class="abl31"><img src="{THEME}/images/spacer.gif" width="20" height="1" alt="" /></td>
                            <td align="left" valign="top" class="stext">

                                   <table width="100%" border="0">
{form}

<tr>
        <td style="padding:2px" class="option">
        Категория: <font color=red>*</font><br /><a href="http://xsonz.ru/" title="xSonz.Ru - Всё для настоящего вебмастера">xSonz.Ru - Всё для настоящего вебмастера</a>
<span class=small><div align="left"><font color=#a9a9a9>Выберите категорию организации</font></div></span>
        <td width="200" height="200" align="right">{input_cat}
        </tr>
<tr><td background="/engine/skins/images/mline.gif" height=1 colspan=2></td></tr>


<tr>
        <td style="padding:2px" class="option">
       Название фирмы: <font color=red>*</font><br />
<span class=small><div align="left"><font color=#a9a9a9>Полное название фирмы</font></div></span>
        <td width=200 height=50 align=right>{input_name}
        </tr>
<tr><td background="/engine/skins/images/mline.gif" height=1 colspan=2></td></tr>

<tr>
        <td style="padding:2px" class="option">
         Описание: <font color=red>*</font><br />
<span class=small><div align="left"><font color=#a9a9a9>Описание видов деятельности фирмы</font></div></span>
        <td width=200 height=100 align=right>{input_info}
        </tr>
<tr><td background="/engine/skins/images/mline.gif" height=1 colspan=2></td></tr>

<tr>
        <td style="padding:2px" class="option">
         Адрес: <font color=red>*</font><br />
<span class=small><div align="left"><font color=#a9a9a9>Адрес местонахождения организации</font></div></span>
        <td width=200 height=50 align=right>{input_adress}
        </tr>
<tr><td background="/engine/skins/images/mline.gif" height=1 colspan=2></td></tr>

<tr>
        <td style="padding:2px" class="option">
         Телефон(ы): <font color=red>*</font><br />
<span class=small><div align="left"><font color=#a9a9a9>Можно указать несколько телефонов через запятую</font></div></span>
        <td width=200 height=50 align=right>{input_phone}
        </tr>
<tr><td background="/engine/skins/images/mline.gif" height=1 colspan=2></td></tr>
<tr>
        <td style="padding:2px" class="option">
         Факс: <br />
<span class=small><div align="left"><font color=#a9a9a9>Номер факса (если есть)</font></div></span>
        <td width=200 height=50 align=right>{input_fax}
        </tr>
<tr><td background="/engine/skins/images/mline.gif" height=1 colspan=2></td></tr>
<tr>
        <td style="padding:2px" class="option">
         E-mail: <br />
<span class=small><div align="left"><font color=#a9a9a9>Электронный адрес (если есть)</font></div></span>
        <td width=200 height=50 align=right>{input_email}
        </tr>
<tr><td background="/engine/skins/images/mline.gif" height=1 colspan=2></td></tr>
<tr>
        <td style="padding:2px" class="option">
         Вебсайт: <br />
<span class=small><div align="left"><font color=#a9a9a9>Ссылка на сайт (если есть)</font></div></span>
        <td width=200 height=50 align=right>{input_url}
        </tr>
<tr><td background="/engine/skins/images/mline.gif" height=1 colspan=2></td></tr>
{xfields}
<tr><td background="/engine/skins/images/mline.gif" height=1 colspan=2></td></tr>
[sec_code]
<tr>
        <td style="padding:2px" class="option">
         Секретный код: <font color=red>*</font>  
<span class=small><div align="left">{code}</div></span>
        <td width=200 height=50 align=right> <input class="inputstyle_03" name="sec_code" size="14" />
</tr>
[/sec_code]
<tr>
        <td style="padding:2px" class="option" align="center" colspan=2>
 <div align="center"><br /><font color=red>{add_restrict}<br />Поля, обязательные для заполнения помечены ( * )<br />
Публикация ссылок на сторонние сайты запрещена!</font></div></span></tr><tr>
        <td width=100% height=50 align="center" colspan=2>{input_submit}
</tr>
{/form}
</table>
                            </td>
                            <td width="20" align="right" valign="top" class="abl33"><img src="{THEME}/images/spacer.gif" width="20" height="1" alt="" /></td>
                          </tr>
                          <tr>
                            <td width="20" align="left" valign="top"><img src="{THEME}/images/dlet_abl31.gif" width="20" height="5" alt="" /></td>
                            <td><img src="{THEME}/images/spacer.gif" width="1" height="5" alt="" /></td>
                            <td width="20" align="right" valign="top"><img src="{THEME}/images/dlet_abl33.gif" width="20" height="5" alt="" /></td>
                          </tr>
                          <tr>
                            <td width="20" align="left" valign="top"><img src="{THEME}/images/dlet_abl41.gif" width="20" height="40" alt="" /></td>
                            <td class="abl42"></td>
                            <td width="20" align="right" valign="top"><img src="{THEME}/images/dlet_abl43.gif" width="20" height="40" alt="" /></td>
                          </tr>
                        </table>
                        <br />
                        <br />