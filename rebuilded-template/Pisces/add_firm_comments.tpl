
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="20" align="left" valign="top"><img src="{THEME}/images/dlet_abl01.gif" width="20" height="30" alt="" /></td>
                            <td align="left" valign="top" class="abl02"><table width="100%" border="0" cellpadding="0" cellspacing="0" class="abl121">
                                <tr>
                                  <td width="40" height="30"><img src="{THEME}/images/spacer.gif" width="40" height="1" alt="" /></td>
                                  <td align="left" class="ntitle">Написать комментарий</td>
                                </tr>
                              </table></td>
                            <td width="20" align="right" valign="top"><img src="{THEME}/images/dlet_abl13.gif" width="20" height="30" alt="" /></td>
                          </tr>
                          <tr>
                            <td width="20" align="left" valign="top"><img src="{THEME}/images/dlet_abl51.gif" width="20" height="30" alt="" /></td>
                            <td align="left" valign="top" class="abl22"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td height="30" class="abl221">&nbsp;</td>
                                </tr>
                              </table></td>
                            <td width="20" align="right" valign="top"><img src="{THEME}/images/dlet_abl53.gif" width="20" height="30" alt="" /></td>
                          </tr>
                          <tr>
                            <td width="20" align="left" valign="top" class="abl31"><img src="{THEME}/images/spacer.gif" width="20" height="1" alt="" /></td>
                            <td valign="top" class="stext" align="left">
                              <table width="480" border="0" cellspacing="0" cellpadding="0">
[not-logged]
                                <tr>
                                  <td width="80" height="25">Ваше Имя:</td>
                                  <td width="400"><input type="text" name="name" id="name" class="f_input" /></td>
                                </tr>
                                <tr>
                                  <td width="80" height="25">Ваш E-Mail:</td>
                                  <td width="400"><input type="text" name="mail" id="mail" class="f_input" /></td>
                                </tr>
[/not-logged]
                                <tr>
                                  <td colspan="2">{editor}</td>
                                </tr>
[sec_code]
                                <tr>
                                  <td width="80">Код:</td>
                                  <td width="400"><br />{sec_code}</td>
                                </tr>
                                <tr>
                                  <td width="80" height="35">Введите код:</td>
                                  <td width="400"><input type="text" name="sec_code" id="sec_code" style="width:115px" class="f_input" /></td>
                                </tr>
[/sec_code]
                                <tr>
                                  <td colspan="2"><br />
                                  <input onclick="doAddFirmComments();return false;" id="but" name="submit" type="image" style="width:80px; height:20px" src="{THEME}/images/dlet_bttn_submit.gif" alt="Отправить" />
                              </td>
			       </tr>
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
                            <td class="abl42">&nbsp;</td>
                            <td width="20" align="right" valign="top"><img src="{THEME}/images/dlet_abl43.gif" width="20" height="40" alt="" /></td>
                          </tr>
                        </table>



			<div class="mainf">Написать комментарий
<div class="bot"> </div>
</div>
<div class="ssc" style="padding:10px;">
   [not-logged]
Ваше Имя:<br />
<input type="text" name="name" id="name" class="plog" /><br /><br />  
Ваш E-Mail:<br />
<input type="text" name="mail" id="mail" class="plog" /><br /><br />
   [/not-logged]
   
   [not-wysywyg]
{bbcode}
   [/not-wysywyg]
    [not-wysywyg]
        <textarea name="comments" id="comments">{text}</textarea>
      [/not-wysywyg]{wysiwyg}<br />
      
[sec_code]
Код:<br />
{sec_code}<br /><br />
Введите код:<br />
<input type="text" name="sec_code" id="sec_code" style="width:115px" class="plog" /><br /><br />
[/sec_code]
        <input onclick="doAddFirmComments();return false;" name="submit" type="submit" id="but" value="Отправить" />
</div>
<div class="nfoot"> </div>