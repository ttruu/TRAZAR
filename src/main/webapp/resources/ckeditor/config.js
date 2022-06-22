/**
 * @license Copyright (c) 2003-2022, CKSource Holding sp. z o.o. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */


CKEDITOR.editorConfig = function( config ) {
	config.toolbarGroups = [
		{ name: 'document', groups: [ 'mode', 'document', 'doctools' ] },
		{ name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
		{ name: 'editing', groups: [ 'find', 'selection', 'spellchecker', 'editing' ] },
		{ name: 'forms', groups: [ 'forms' ] },
		{ name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi', 'paragraph' ] },
		{ name: 'links', groups: [ 'links' ] },
		{ name: 'basicstyles', groups: [ 'cleanup', 'basicstyles' ] },
		{ name: 'styles', groups: [ 'styles' ] },
		{ name: 'insert', groups: [ 'insert' ] },
		{ name: 'colors', groups: [ 'colors' ] },
		{ name: 'tools', groups: [ 'tools' ] },
		{ name: 'others', groups: [ 'others' ] },
		{ name: 'about', groups: [ 'about' ] }
	];

	config.removeButtons = 'Table,Iframe,SelectAll,Scayt,Replace,Find,Undo,Redo,Cut,Copy,Paste,PasteFromWord,PasteText,Templates,Source,Save,NewPage,ExportPdf,Preview,Print,Form,Checkbox,Radio,TextField,Textarea,Select,Button,HiddenField,Link,Unlink,Anchor,BidiLtr,BidiRtl,Language,Blockquote,CreateDiv,Outdent,Indent,NumberedList,BulletedList,RemoveFormat,CopyFormatting,Superscript,Subscript,Strike,Italic,Underline,JustifyRight,JustifyCenter,JustifyLeft,ImageButton,BGColor,ShowBlocks,JustifyBlock';
	config.filebrowserUploadMethod='form'; <!-- 파일 오류났을때 alert띄워줌 -->
};
