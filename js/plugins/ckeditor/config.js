/**
 * @license Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.html or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
		 
	config.toolbarGroups = [
	    { name: 'clipboard',   groups: [ 'clipboard', 'undo' ] },
	    { name: 'editing',     groups: [ 'find', 'selection', 'spellchecker' ] },
	    { name: 'links' },
	    '/',
	    { name: 'basicstyles', groups: [ 'basicstyles' ] },
	    { name: 'paragraph',   groups: [ 'list', 'indent', 'align' ] },
	    { name: 'styles' },
	    { name: 'colors' },
	    
	];
};
