<!-- $Id$ -->
<html>
	<head><title></title>
	<link type="text/css" REL="stylesheet" HREF="css/main.css"></link>
	<script language="JavaScript">
	<!--
		function showItem(id) {
			F1=open("getCall.php?Q=VC&pid={PID}&id="+id,"Caller","width=610, height=600, left=100, top=50, scrollbars=yes");
		}
		function anschr() {
			F1=open("showAdr.php?PID={PID}","Adresse","width=340, height=400, left=100, top=50, scrollbars=yes");
		}
		function notes() {
			F1=open("showNote.php?pid={PID}","Notes","width=400, height=400, left=100, top=50, scrollbars=yes");
                }

	//-->
	</script>
<body>
<p class="listtop">Detailansicht</p>
<div style="position:absolute; top:33px; left:8px;  width:770px;">
	<ul id="tabmenue">
	<li><a href="{Link1}">Lieferantendaten</a><li>
	<li><a href="{Link2}" id="aktuell">Kontakte</a></li>
	<li><a href="{Link3}">Ums&auml;tze</a></li>
	<li><a href="{Link4}">Dokumente</a></li>
	<span title="Wichtige MItteilung">{Cmsg}</span>
	</ul>
</div>

<span style="position:absolute; left:10px; top:67px; width:95%;">
<!-- Beginn Code ------------------------------------------->
<div style="float:left; width:49%; height:410px; text-align:center; border: 1px solid black;">
	<div style="float:left; width:100%; height:50px; text-align:left; border-bottom: 1px solid black;" class="fett">
		{Lname} &nbsp; &nbsp; {LInr}<br />
		{Ldepartment_1}<br /> 
		{Plz} {Ort}<br />
	</div>
	<div style="float:left; width:70%; height:210px; text-align:left; border-bottom: 1px solid black;" class="gross">
		{Anrede} {Titel}<br />
		{Vname} {Nname}<br />
		{StreetC}<br />
		<span class="mini">&nbsp;<br /></span>
		{LandC}{PlzC} {OrtC}<br />
		<span class="mini">&nbsp;<br /></span>
		<img src="image/telefon.gif"> {Telefon}<br />
		&nbsp;<img src="image/mobile.gif"> {Mobile}<br />
		<img src="image/fax.gif"> {Fax}<br />
		<a href="mail.php?TO={eMail}&KontaktTO=K{PID}">{eMail}</a><br />
		<a href="{www}" target="_blank">{www}</a><br /><br />
	</div>
	<div style="float:left; width:30%; height:210px; text-align:right; border-bottom: 1px solid black;" class="gross">
		{PID} &nbsp; <a href="#" onCLick="anschr();"><img src="image/brief.gif" border="0"></a><br />
		{IMG}</br >
		{GebDat}</br />
		{Position}<br />
		{Abteilung}<br />
	</div>
	<div style="float:none; width:100%; height:385px; text-align:center; border-bottom: 1px solid black;" class="normal">
		<span class="klein">{Notiz}</span>
	</div><br>
	<div style="position:absolute; bottom:8px; width:49%; " class="normal">
	<!--div style="float:none; width:100%; height:15px; text-align:center; border: 0px solid black;" class="normal"-->
		[<a href="javascript:vcard()">VCard</a>] [<a href="personen3.php?id={PID}&edit=1&Quelle=L">{Edit}</a>]
		<b>Kontakt:</b> [<a href="personen3.php?fid={FID}&Quelle=F">eingeben</a>] [<a href="personen1.php?fid={FID}&Quelle=F">aus Liste</a>]
	</div>
</div>
<span style="float:left; width:50%; height:410px; text-align:left; border: 1px solid black; border-left:0px;">
<table width="99%">
<!-- BEGIN Liste -->
	<tr  class="smal" onMouseover="this.bgColor='#FF0000';" onMouseout="this.bgColor='{LineCol}';" bgcolor="{LineCol}" onClick="showItem({IID});">
		<td class="smal" width="100px">{Datum} {Zeit}</td>
		<td class="smal" width="60px">{Nr}</td>
		<td class="smal le">{Betreff}</td>
		<td class="smal le">{Name}</td>
	</tr>
<!-- END Liste -->
</table>
	<!--span style="float:left;  text-align:left; border:0px solid black"-->	
	<span style="position:absolute; bottom:10px;">
		<form name="ksearch" onSubmit="return ks();"> &nbsp; 
		<a href="firma2.php?id={PID}&start={PREV}">&lt;</a> 
			<a href="firma2.php?id={PID}&start={PAGER}" class="bold">neu laden</a> 
		<a href="firma2.php?id={PID}&start={NEXT}">&gt; &nbsp;
		<input type="text" name="suchwort" size="20">
			<input type="submit" name="ok" value="suchen">
		</form>
	</span>
</span>
<!-- End Code ------------------------------------------->
</span>
</body>
</html>
