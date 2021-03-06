<%@ page pageEncoding="utf-8"%>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>first</title>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%-- <link rel="stylesheet" type="text/css" href="<c:url value='/css/ui.css'/>" /> --%>
<style type="text/css">
@CHARSET "UTF-8";

a:link {
	text-decoration: none;
	color: #656565;
}
input[type=file] {
	border-radius: 3px;
	padding: 5px 11px;
	color: #fff !important;
	display: inline-block;
	background-color: #6b9ab8;
	border: 1px solid #56819d;
	vertical-align: middle;
}
 a:visited {
 text-decoration: none;
 
 }


input[type=button] {
	border-radius: 3px;
	padding: 5px 11px;
	color: #fff !important;
	display: inline-block;
	background-color: #004e66;
	border: 1px solid #e1eef6;
	vertical-align: middle;
}


input[type=submit] {
	border-radius: 3px;
	padding: 5px 11px;
	color: #fff !important;
	display: inline-block;
	background-color: #004e66;
	border: 1px solid #e1eef6;
	vertical-align: middle;
}


.board_list {
	width: 100%;
	border-top: 2px solid #252525;
	border-bottom: 1px solid #ccc
}

.board_list thead th:first-child {
	background-image: none
}

.board_list thead th {
	border-bottom: 1px solid #ccc;
	padding: 12px 0 13px 0;
	color: #3b3a3a;
	vertical-align: middle
}
.board_subject {
	font-size: 20px;
	}
.board_subway {
	text-align: right;
}
.session_view{
padding-left: 50px;

}
.board_list tbody td {
	border-top: 1px solid #ccc;
	padding: 10px 0;
	text-align: center;
	vertical-align: middle 
}
.board_contents {
	text-align: top;
	vertical-align: top;
}

.board_list tbody tr:first-child td {
	border: none
}

.board_list tbody td.title {
	text-align: left;
	padding-left: 20px
}

.board_list tbody td a {
	display: inline-block
}

.board_view {
	margin-left: 150px;
	width: 1000px;
	border-top: 2px solid #252525;
	border-bottom: 1px solid #ccc
}

.board_view tbody th {
	text-align: left;
	background: #f7f7f7;
	color: #3b3a3a
}


.board_view tbody th.list_tit {
	font-size: 13px;
	color: #000;
	letter-spacing: 0.1px
}

.board_view tbody .no_line_b th, .board_view tbody .no_line_b td {
	border-bottom: none
}

.board_view tbody th, .board_view tbody td {
	padding: 15px 0 16px 16px;
	border-bottom: 1px solid #c
}

.board_view tbody td.view_text {
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	padding: 45px 18px 45px 18px
}

.board_view tbody th.th_file {
	padding: 0 0 0 15px;
	vertical-align: middle
}

.wdp_90 {
	width: 90%
}

.btn {
	border-radius: 3px;
	padding: 5px 11px;
	color: #fff !important;
	display: inline-block;
	background-color: #004e66;
	border: 1px solid #e1eef6 ;
	vertical-align: middle
}

select {
    width: 150px;
    height: 20px;
    padding-left: 10px;
    font-size: 14px;
    color: #004e66 ;
    border: 1px solid #004e66 ;
    border-radius: 3px;
}

</style>



<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript" charset="utf-8">
function gfn_isNull(str) {
    if (str == null) return true;
    if (str == "NaN") return true;
    if (new String(str).valueOf() == "undefined") return true;   
    var chkStr = new String(str);
    if( chkStr.valueOf() == "undefined" ) return true;
    if (chkStr == null) return true;   
    if (chkStr.toString().length == 0 ) return true;  
    return false;
}
 
function ComSubmit(opt_formId) {
    this.formId = gfn_isNull(opt_formId) == true ? "commonForm" : opt_formId;
    this.url = "";
     
    if(this.formId == "commonForm"){
        $("#commonForm")[0].reset();
    }
     
    this.setUrl = function setUrl(url){
        this.url = url;
    };
     
    this.addParam = function addParam(key, value){
        $("#"+this.formId).append($("<input type='hidden' name='"+key+"' id='"+key+"' value='"+value+"' >"));
    };
     
    this.submit = function submit(){
        var frm = $("#"+this.formId)[0];
        frm.action = this.url;
        frm.method = "get";
        frm.submit();  
    };
}
</script>