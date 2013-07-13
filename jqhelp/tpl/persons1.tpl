<script language="JavaScript">
    function setLetter(letter) {//kann weg??
        document.formular.cp_name.value=letter;
        document.formular.first.value="1";
        document.formular.submit();
    }
    $(document).ready(function() {
        $( "input[type=button],input[type=submit]" ).button(); 
        $( ".fett" ).click(function() {
            if ( $(this).html() == '#' ) first = '~';
            else first = $(this).html(); 
            $.ajax({
                type: "POST",
                data: "first=" + first + "&andor=and&vendor=on&customer=on",  
                url: "jqhelp/getPersons1.php",
                success: function(res) {
                    if ( res == 'viele' )  $( "#dialog_viele" ).dialog( "open" );
                    if ( !res ) $( "#dialog_keine" ).dialog( "open" );
                    else {
                        $( "#dialog_keine #dialog_viele #dialog_no_sw" ).dialog( "close" );
                        $( "#suchfelder_pers" ).hide();
                        $( "#results_pers").html(res); 
                        $( "#results_pers").show();
                    }                       
                }
            });
            return false;
        });           
        $( "#suche_pers" ).click(function() {
            //alert($("#formular_pers").serialize() + '&suche=suchen');
            $.ajax({
                type: "POST",
                data: $("#formular_pers").serialize() + '&suche=suchen', 
                url: "jqhelp/getPersons1.php",
                success: function(res) {
                    if( res ) {
                        //$( "#dialog_no_results{Q}" ).dialog( "close" );
                        $( "#suchfelder_pers" ).hide();
                        $( "#results_pers" ).html(res); 
                        $( "#results_pers" ).show();
                    }
                    else {
                        //$("#dialog_no_results{Q}").dialog( "open"); 
                        $( "#name_pers" ).focus();
                    }                                              
                }
            });
            return false;
        });
        $( "#reset_pers" ).click(function() {
        //Kein leeres Template laden, da sonst die IDs doppelt vergeben werden!
            //$( "#dialog_no_results_pers" ).dialog( "close" );
            $( "#formular_pers" ).find(':input').each(function() {
                switch(this.type) {
                    case 'text':
                        $(this).val('');
                    break;
                    case 'checkbox':
                    case 'radio':
                        this.checked = false
                }
            });
            $( "#andor_pers, #fuzzy_pers, #vendor_pers, #customer_pers" ).click();
            $( "#cp_name" ).focus();
            return false;
        });
    });
</script>

<!-- <body onLoad="document.formular.cp_name.focus();" -->
<div id="suchfelder_pers">

<p class="ui-state-highlight ui-corner-all" style="margin-top: 20px; padding: 0.6em;"> 
<button class="fett">A</button> 
<button class="fett">B</button> 
<button class="fett">C</button> 
<button class="fett">D</button> 
<button class="fett">E</button> 
<button class="fett">F</button> 
<button class="fett">G</button> 
<button class="fett">H</button> 
<button class="fett">I</button> 
<button class="fett">J</button> 
<button class="fett">K</button> 
<button class="fett">L</button> 
<button class="fett">M</button> 
<button class="fett">N</button> 
<button class="fett">O</button> 
<button class="fett">P</button> 
<button class="fett">Q</button> 
<button class="fett">R</button> 
<button class="fett">S</button> 
<button class="fett">T</button> 
<button class="fett">U</button> 
<button class="fett">V</button> 
<button class="fett">W</button> 
<button class="fett">X</button> 
<button class="fett">Y</button> 
<button class="fett">Z</button> 
<button class="fett">#</button> 
</p>

<form name="formular" id="formular_pers" enctype='multipart/form-data' action="#" method="post">
<input type="hidden" name="FID1" value="{FID1}">
<input type="hidden" name="first" value="">
<input type="hidden" name="Quelle" value="{Quelle}">
<input type="hidden" name="employee" value="{employee}">




	<div class="zeile">
		<span class="label">.:gender:.</span>
		<span class="leftfeld">
             <select name="cp_gender" tabindex="1" style="width:9em;">
                    <option value="" {cp_gender}>
                    <option value="m" {cp_genderm}>.:male:.
                    <option value="f" {cp_genderf}>.:female:.
                </select>
		</span>
		<span class="label">Abteilung</span>
		<span class="leftfeld"><input type="text" name="cp_abteilung" size="20" maxlength="25" value="{cp_abteilung}" tabindex="12"></span>
	</div>
	<div class="zeile">
		<span class="label">Titel</span>
		<span class="leftfeld"><input type="text" name="cp_title" size="27" maxlength="75" value="{cp_title}" tabindex="2"></span>
		<span class="label">Position</span>
		<span class="leftfeld"><input type="text" name="cp_position" size="20" maxlength="25" value="{cp_position}" tabindex="13"></span>
	</div>
	<div class="zeile">
		<span class="label">Vorname</span>
		<span class="leftfeld"><input type="text" name="cp_givenname" size="27" maxlength="75" value="{cp_givenname}" tabindex="3"></span>
		<span class="label">Stichwort</span>
		<span class="leftfeld"><input type="text" name="cp_stichwort1" size="25" maxlength="50" value="{cp_stichwort1}" tabindex="14"></span>
	</div>
	<div class="zeile">
		<span class="label">Nachname</span>
		<span class="leftfeld"><input type="text" name="cp_name" id="cp_name" size="27" maxlength="75" value="{cp_name}" tabindex="4"></span>
		<span class="label">Bemerkung</span>
		<span class="leftfeld"><input type="text" name="cp_notes" size="25" maxlength="50" value="{cp_notes}" tabindex="15"></span>
	</div>
	<div class="zeile">
		<span class="label">Strasse</span>
		<span class="leftfeld"><input type="text" name="cp_street" size="27" maxlength="75" value="{cp_street}" tabindex="5"></span>
		<span class="label">Geb.-Datum</span>
		<span class="leftfeld"><input type="text" name="cp_gebdatum" size="12" maxlength="10" value="{cp_gebdatum}" tabindex="16"><span class="klein">TT.MM.JJJJ</span></span>
	</div>
	<div class="zeile">
				<span class="label">Länder-Kode / Plz</span>
				<span class="leftfeld">
					<input type="text" name="cp_country" size="2" maxlength="3" value="{cp_country}" tabindex="6">
					<input type="text" name="cp_zipcode" size="7" maxlength="7" value="{cp_zipcode}" tabindex="7">
				</span>
				<!-- span class="label">Land</span>
				<span class="leftfeld">
			<select name="country" tabindex="10">
			<!-- BEGIN countries -->
				<option value="{country}" {country_sel}>{country}</option>
			<!-- END countries -->
			</select>
				</span -->

			</div>
			<div class="zeile">
				<span class="label">Ort</span>
				<span class="leftfeld"><input type="text" name="cp_city" size="27" maxlength="75" value="{cp_city}" tabindex="8"></span>
				<span class="label">Fax</span>
				<span class="leftfeld"><input type="text" name="cp_fax" size="27" maxlength="75" value="{cp_fax}" tabindex="17"></span>
			</div>
			<div class="zeile">
				<span class="label">Telefon</span>
				<span class="leftfeld"><input type="text" name="cp_phone1" size="27" maxlength="75" value="{cp_phone1}" tabindex="9"></span>
				<span class="label">eMail</span>
				<span class="leftfeld"><input type="text" name="cp_email" size="27" maxlength="75" value="{cp_email}" tabindex="18"></span>
			</div>
			<div class="zeile">
				<span class="label">Mobiltelefon</span>
				<span class="leftfeld"><input type="text" name="cp_phone2" size="27" maxlength="75" value="{cp_phone2}" tabindex="10"></span>
				<span class="label">www</span>
				<span class="leftfeld"><input type="text" name="cp_homepage" size="27" maxlength="25" value="{cp_homepage}" tabindex="19"></span>
			</div>
		  <div class="zeile">
			<span class="label">Firmenname</span>
			<span class="leftfeld"><input type="text" name="customer_name" size="27" maxlength="75" value="{customer_name}" tabindex="11"></span>
			<!-- span class="label">Kundentyp</span>
			<span class="leftfeld"><input type="text" name="business_description" size="27" maxlength="75" value="{business_description}" tabindex="20"></span -->
		  </div>
			<div class="zeile"> 
                <span class="klein">.:search:. <input type="radio" name="andor" id="andor_pers" value="and" checked tabindex="40">.:all:. <input type="radio" name="andor" value="or" tabindex="40">.:some:.</span><br>
				<input type="checkbox" name="fuzzy" id="fuzzy_pers" value="%" checked><span class="klein">Unscharf suchen&nbsp;&nbsp;<b>{Msg}</b></span> <input type="checkbox" name="vendor" id="vendor_pers" checked><span class="klein">Lieferanten</span><input type="checkbox" name="customer" id="customer_pers" checked><span class="klein">Kunden</span><br>
				<input type="checkbox" name="deleted"><span class="klein">.:deletetcontact:.</span><br>
				{Btn1} {Btn3} <input type="submit" class="anzeige" name="suche" id="suche_pers" value="suchen"> <input type="submit" class="clear" name="reset" id="reset_pers" value="clear">
				<a href="extrafelder.php?owner=P0"><img src="image/extra.png" alt="Extras" title="Extras" border="0" /></a>
			</div>
		</span>
		<div style="margin-left:2.5em; float:left;   margin-top:3em; border: 0px solid black;">

		<!-- Gibt es hier die Möglichkeit eine Fallentscheidung zu machen?  Falls sonder dann einblenden:-->
Attribute: <br>
<!-- BEGIN sonder -->
	<input class="klein" type="checkbox" name="cp_sonder[]" value="{sonder_id}"><span class="klein">{sonder_key}</span><br>
<!-- END sonder -->		
</div>	
</form>

</div>
<div id="results_pers">Results:::</div>




