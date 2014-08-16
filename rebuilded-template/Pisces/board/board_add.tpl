<script type="text/javascript"> 
(function() { // ���, ��� ���������, ����������� ������ ��������� �������
    // �� ��������� �������� ��������� ������� ������� init()
    if (window.addEventListener) 
        window.addEventListener("load", init, false);
    else if (window.attachEvent) 
        window.attachEvent("onload", init);

    // ������������� ����������� ������� ��� ���� � ��������� ����,
    // ��� ��� ����������
    function init() {
        // ���� �� ���� ������ � ���������
        for(var i = 0; i < document.forms.length; i++) {
            var f = document.forms[i];  // ������� �����

            // ������������, ��� ����� �� ������� ��������
            var needsValidation = false;

            // ���� �� ���� ��������� ������� �����
            for(j = 0; j < f.elements.length; j++) {
                var e = f.elements[j];  // ������� �������

                // ������� ������������ ������ ���� <input type="text">
                if (e.type != "text") continue;

                // ���������, ������� �� ��������, ��������� ��������
                var pattern = e.getAttribute("pattern");
                // ����� ���� �� ������������ e.hasAttribute()
                // �� MS IE �� ������������ ���
                var required = e.getAttribute("required") != null;

                // ������� required - ��� ���� ������� ����� ������
                // �������� pattern
                if (required && !pattern) {
                    pattern = "\\S";
                    e.setAttribute("pattern", pattern);
                }

                // ���� ������� ������� ��������,
                if (pattern) {
                    // ��������� ��� ������ ��������� ����������� ��������
                    e.onchange = validateOnChange;
                    // ���������, ����� ����� �������� ���������� onsubmit
                    needsValidation = true;
                }
            }

            // ���� ���� �� ���� ������� ����� ������� ��������,
            // �� ���������� ���������� ���������� ������� onsubmit �����
            if (needsValidation) f.onsubmit = validateOnSubmit;
        }
    }
          
    // ��� ������� - ���������� ������� onchange ��� ���������� ����, �������
    // ������� ��������. �� ���������, ��� � ������� init() �� �������������
    // ������� required � pattern
    function validateOnChange() {
        var textfield = this;                            // ��������� ����
        var pattern = textfield.getAttribute("pattern"); // ������
        var value = this.value;                          // ������, ��������� �������������

        // ���� �������� �� ������������� �������, ����������
        // �������� �������� ����� ������ "invalid"
        if (value.search(pattern) == -1) textfield.className = "invalid";
        else textfield.className = "valid";
    }

    // ��� ������� - ���������� ������� onsubmit ��� ����� �����,
    // ��������� ��������
    function validateOnSubmit() {
        // ����� ��������� ����� ��������� �������� ���� ����� � �����
        // � ���������� �� �������� className � ��������������� ��������.
        // ���� ���� �� ���� �� ���� ����� �������� ������, ������� ����������
        // ���� � ������������� �������� ������ �����.
        var invalid = false;  // ������������, ��� ��� ���������
        // ���� �� ���� ��������� �����
        for(var i = 0; i < this.elements.length; i++) {
            var e = this.elements[i];
            // ���� ������� - ��� ��������� ����, ��� �������� ����������
            // ��� ���������� ������� onchange
            if (e.type == "text" && e.onchange == validateOnChange) {
                e.onchange(); // ������� ���������� ��� ��������� ��������
                // ���� �������� �� �������� - ������ ��� ����� �� ������ ��������
                if (e.className == "invalid") invalid = true;
            }
        }

        // ���� ����� �� ������ ��������, ������� ���������� ����
        // � ������������� �������� �����
        if (invalid) {
            alert("����� ��������� �� ��������� ��� ���� ������� ������������ ������.\n" +
                  "����������, ��������� ������������ ���������� ����� � ��������� �������.");
            return false;
        }
    }
})();
</script>
<style type="text/css">
input.invalid { background: #faa } /* ����������� ��� ��� ����� � �������� */
input.valid { background: #afa } /* ����������� ��� ��� �����, ����������� ��������� */
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
 <!-- START BOARD FORM ���� ����� ������������ ��� ���������� ���� ������ required ��� ������ � ������ ������-->
<form  method="post" enctype="multipart/form-data" name="board-comments-form" id="board-comments-form" action="/index.php?do=board">
                    <table width="500" border="0" cellspacing="0" cellpadding="0" align="center">

                      <tr>
                        <td width="140" height="25">���������:</td>
                        <td width="360"><select onchange="window.open(this.options[this.selectedIndex].value,'_top')">{selectcat}</select></td>
                      </tr>
					  
					                        <tr>
                        <td width="140" height="25">������������:</td>
                        <td width="360"><select name="scat_id">{selectsubcat}</select></td>
                      </tr>
[not-logged]
                      <tr>
                        <td width="140" height="25" align="left">���� ���:</td>
                        <td width="360"><input type="text" name="autor" class="f_input" required/></td>
                      </tr>
[/not-logged]
					                        <tr>
                        <td width="140" height="25">�������� ����������:</td>
                        <td width="360"><input type="text" name="name" class="f_input" required/></td>
                      </tr>
					                        <tr>
                        <td width="140" height="25">���������:</td>
                        <td width="360"><input type="text" name="price" class="f_input" required/></td>
                      </tr>
					                        <tr>
                        <td width="140" height="25">������:</td>
                        <td width="360"><select name="money">{selectmoney}</select></td>
                      </tr>
					                        <tr>
                        <td width="140" height="25">�������:</td>
                        <td width="360"><input type="text" name="tel" class="f_input" /></td>
                      </tr>
					                        <tr>
                        <td width="140" height="25">E-Mail:</td>
                        <td width="360"><input type="text" name="mail" class="f_input" value="{email}" pattern="^\s*\w+@\w+\.\w+\s*" /></td>
                      </tr>
					  
	
					<tr>
                        <td width="140" height="25">���� ��� ������:</td>
                        <td width="360"><input type="file" name="foto_0" /></td>
                      </tr>
					 <tr>
                        <td width="140" height="25">���. ���� �1:</td>
                        <td width="360"><input type="file" name="foto_1" /></td>
                      </tr>
					 <tr>
                        <td width="140" height="25">���. ���� �2:</td>
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
                        <td width="140">���:</td>
                        <td width="360"><br />{sec_code}</td>
                      </tr>
                      <tr>
                        <td width="140" height="35">������� ���:</td>
                        <td width="360"><input type="text" name="sec_code" id="sec_code" style="width:115px" class="f_input" /></td>
                      </tr>
[/sec_code]
                      <tr>
                        <td colspan="2"><br />
						{hide}
						<input type="submit" name="submit" value="���������"><input type="hidden" name="addboard" value="ok" />
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