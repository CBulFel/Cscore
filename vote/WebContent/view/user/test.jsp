<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
  <meta charset='utf-8'>
  <title>Date cell type - Handsontable</title>

  <!--
  Loading Handsontable
  -->
  <link data-jsfiddle="common" rel="stylesheet" media="screen" href="dist/handsontable.css">
  <link data-jsfiddle="common" rel="stylesheet" media="screen" href="dist/pikaday/pikaday.css">
  <script data-jsfiddle="common" src="dist/pikaday/pikaday.js"></script>
  <script data-jsfiddle="common" src="dist/moment/moment.js"></script>
  <script data-jsfiddle="common" src="dist/zeroclipboard/ZeroClipboard.js"></script>
  <script data-jsfiddle="common" src="dist/handsontable.js"></script>
  <script data-jsfiddle="common" src="js/jquery-2.2.3.min.js"></script>
  <script data-jsfiddle="common" src="dist/jqueryHOT.js"></script>
  
  <link data-jsfiddle="common" rel="stylesheet" media="screen" href="css/samples.css">
 
  
  <script type="text/javascript">
    
	/*  // original by: Kevin van Zonneveld (http://kevin.vanzonneveld.net)
  function strip_tags(input, allowed) {
    var tags = /<\/?([a-z][a-z0-9]*)\b[^>]*>/gi,
      commentsAndPhpTags = /<!--[\s\S]*?-->|<\?(?:php)?[\s\S]*?\?>/gi;

    // making sure the allowed arg is a string containing only tags in lowercase (<a><b><c>)
    allowed = (((allowed || "") + "").toLowerCase().match(/<[a-z][a-z0-9]*>/g) || []).join('');

    return input.replace(commentsAndPhpTags, '').replace(tags, function ($0, $1) {
      return allowed.indexOf('<' + $1.toLowerCase() + '>') > -1 ? $0 : '';
    });
  }

  function safeHtmlRenderer(instance, td, row, col, prop, value, cellProperties) {
    var escaped = Handsontable.helper.stringify(value);
    escaped = strip_tags(escaped, '<em><b><strong><a><big>'); //be sure you only allow certain HTML tags to avoid XSS threats (you should also remove unwanted HTML attributes)
    td.innerHTML = escaped;

    return td;
  }*/
/*
  function coverRenderer (instance, td, row, col, prop, value, cellProperties) {
    var escaped = Handsontable.helper.stringify(value),
      img;

    if (escaped.indexOf('http') === 0) {
      img = document.createElement('IMG');
      img.src = value;

      Handsontable.Dom.addEvent(img, 'mousedown', function (e){
        e.preventDefault(); // prevent selection quirk
      });

      Handsontable.Dom.empty(td);
      td.appendChild(img);
    }
    else {
      // render as text
      Handsontable.renderers.TextRenderer.apply(this, arguments);
    }

    return td;
  }*/
  //
  /*
  function myF7Editor(instance, td, row, col, prop, value, cellProperties){
		if(value){
			var escaped = Handsontable.helper.stringify(value);
			var myF7 = document.createElement('myF7');
			myF7.innerHTML = value;
			myF7.id = value;
			$(myF7).click(function(){
				alert($(this).text()+td+' col'+col);
			});
		  
			Handsontable.Dom.empty(td);
			td.appendChild(myF7);
		}
		return td;
  }*/
  function getCarData() {
      return data = [
		{number:'0001',name:'张三',sex:'男',birthday:'1989-12-20',age:20,money:3546,userpage:'<a href="www.baidu.com">百度111</a>',person:'我是f7'},
		{number:'0002',name:'李四',sex:'女',birthday:'1989-12-20',age:20,money:3546,userpage:'<a href="www.baidu.com">百度</a>',person:'我是f7'}
	  ];
    };
	/*
	function dataSchema (){
		
	}*/
	//var selection = [0,0,0,0];
	$(document).ready(function(){
		var container = document.getElementById('example1'),hot;
        hot = new Handsontable(container, {
			  data: getCarData(),
			  maxRows:data.length,
			  rowHeaders: false,//标号
			  //minSpareRows: 1,//初始化行
			  //colHeaders: true,
			  colHeaders: ['编码', '名称', '性别', '出生日期','年龄','工资(元)','个人主页','员工'],
			  columnSorting: true,sortIndicator:true,
			  
			  autoWrapCol:false,autoWrapRow:false,
			  
			  manualColumnResize: false,
			  manualRowResize: false,//stretchH: 'all',
			  //outsideClickDeselects: false,removeRowPlugin: true,
			  contextMenu: false,
			  comments: false,
			  
			 // manualColumnMove：true,
			//  manualRowMove:true,
			  //autoColumnSize:true,
			  colWidths:[100,100,80,100,100,200,80],
			  
			  //cell: [{row: 0, col: 6, comment: '实际工资'}],
			  columns: [
				{data:'number',readOnly: true},
				{data:'name',readOnly: true},
				{data:'sex',editor:'select',selectOptions:['男','女','保密'],readOnly: true},
				{data:'birthday',type:'date',dateFormat: 'YYYY-MM-DD',readOnly: true},
				{data:'age',type:'numeric',format:'0',readOnly: true},
				{data:'money',type:'numeric',format:'$ 0,0.00',readOnly: true},
				{data:'userpage',renderer:'html',readOnly: true},
				//{data:'person',renderer:myF7Editor,readOnly: true}
			  ],
			 // afterSelectionEnd: function(x1, y1, x2, y2){
				// selection = [x1,y1,x2,y2];
			// }

		});
		
		/**
		for(var i= 0;i<hot.countRows();i++){
			for(var j=0;j<hot.countCols();j++){
				var cellMeta = hot.getCellMeta(i, j);
				alert(cellMeta.prop+' '+hot.getColHeader(j)+':'+hot.getDataAtCell(i,j));
			}
		}**/
		//alert(hot.countRows());
		/*
		$('#addRow').click(function(){
			hot.alter('insert_row',hot.countRows());
		});
		
		$('#removeRow').click(function(){
			var ridx = selection[0];
			var eidx = selection[2];
			hot.alter('remove_row',ridx,eidx-ridx+1);
			selection = [0,0,0,0];	
		});*/
	});
	/*
function isEmpty(obj){
    for (var name in obj){
        return false;
    }
    return true;
}*/
  </script>
</head>

<body>
	
	<div id="example1" style="width:800px;"></div>
	
	
	
</body>
</html>
