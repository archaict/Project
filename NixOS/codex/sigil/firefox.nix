{ config, pkgs, lib, ... }:
let
  runic = config.colors;
in

{
  programs.firefox = {
    enable=true;
    extensions = with pkgs.nur.repos.rycee.firefox-addons; [
      darkreader
      ublock-origin
      vimium
      decentraleyes
    ];
    profiles.default = {
      id = 0;
      settings = {

        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;

        "browser.uidensity" = 1;
        "browser.tabs.closeTabByDblclick" = true;
        "extensions.update.enabled"  = false;

        "findbar.modalHighlight" = true; 
        "browser.urlbar.trimURLs" = true;

        "media.navigator.audio.full_duplex" = false;
        "media.autoplay.enabled"  = false;

        "browser.display.background_color"= runic.background;
        "browser.display.foreground_color"= runic.foreground;
        

      };
      userChrome = ''
        :root {
       
           /* Minimal Functional Fox variables*/
       
          --mff-bg                    : ${runic.background};
          --mff-fg                    : ${runic.foreground};
          --mff-icon-color            : ${runic.foreground};
          --mff-nav-toolbar-padding   : 8px;
          --mff-sidebar-bg            : var(--mff-bg);
          --mff-sidebar-fg            : var(--mff-fg);
          --mff-sidebar-color         : ${runic.foreground};
       
          --mff-tab-border-radius     : 0px;
          --mff-tab-color             : ${runic.foreground};
          --mff-tab-font-family       : ${config.schema.font}, sans;
          --mff-tab-font-size         : 11pt;
          --mff-tab-font-weight       : 400;
          --mff-tab-height            : 32px;
          --mff-tab-pinned-bg         : ${runic.yellow};
          --mff-tab-selected-bg       : ${runic.blue};
          --mff-tab-soundplaying-bg   : ${runic.green};
       
          --mff-urlbar-color          : ${runic.foreground};
          --mff-urlbar-focused-color  : ${runic.foreground};
          --mff-urlbar-font-family    : ${config.schema.font}, serif;
          --mff-urlbar-font-size      : 12pt;
          --mff-urlbar-font-weight    : 700;

          --mff-urlbar-results-color       : ${runic.foreground};
          --mff-urlbar-results-font-family : ${config.schema.font}, serif;
          --mff-urlbar-results-font-size   : 12pt;
          --mff-urlbar-results-font-weight : 700;
          --mff-urlbar-results-url-color   : ${runic.foreground};
       
       
          /* Overriden Firefox variables*/
          --autocomplete-popup-background  : var(--mff-bg) !important;
          --default-arrowpanel-background  : var(--mff-bg) !important;
          --default-arrowpanel-color       : var(--mff-fg) !important;
          --lwt-toolbarbutton-icon-fill    : var(--mff-icon-color) !important;
          --panel-disabled-color           : var(--mff-bg) !important;
          --toolbar-bgcolor                : var(--mff-bg) !important;
          --urlbar-separator-color         : transparent !important;

        }
       
        /*
           ▄▖  ▌
           ▐ ▀▌▛▌▛▘
           ▐ █▌▙▌▄▌
        */
       
        .tab-background[selected="true"] {
          background: var(--mff-tab-selected-bg) !important;
        }
       
        .tab-background:not[visuallyselected] {
          background: var(--mff-tab-selected-bg) !important;
          opacity: 0.5 !important;
        }
       
        /* This positions the tabs under the navaigator container */
        #titlebar {
          -moz-box-ordinal-group: 3 !important;
        }
       
        .tabbrowser-tab::after,
        .tabbrowser-tab::before {
          border-left: none !important;
        }
       
        .tab-background {
          border: none !important;
        }
       
        .tabbrowser-arrowscrollbox {
          margin-inline-start: 4px !important;
          margin-inline-end: 0px !important;
        }
       
        .tab-close-button {
         display: none !important;
        }
       
        .tab-text {
          font-family: var(--mff-tab-font-family);
          font-weight: var(--mff-tab-font-weight);
          font-size: var(--mff-tab-font-size) !important;
          color: var(--mff-tab-color);
        }
       
        /* Hide the favicon for tabs */
        hbox.tab-content .tab-icon-image {
          display: none !important;
        }
       
        /* Show the favicon for tabs that are pinned */
        hbox.tab-content[pinned=true] .tab-icon-image {
          display: initial !important;
        }
       
        hbox.tab-content[pinned=true] .tab-text {
          display: none !important;
        }
       
        #tabbrowser-tabs {
          --tab-loading-fill: ${runic.foreground} !important;
        }
       
        .tab-label-container:not([textoverflow]) {
          display: flex;
          overflow: hidden;
          justify-content: center;
        width: 50% !important;
          max-width: 50% !important;
          min-width: 50% !important;
        }
       
        .tab-line {
          display: none !important;
        }
       
        .tabbrowser-tab {
          border-radius: var(--mff-tab-border-radius) !important;
          border-width: 0;
          height: var(--mff-tab-height) !important;
          margin-bottom: 4px !important;
          margin-inline-end: 4px !important;
          margin-top: 4px !important;
          max-height: var(--mff-tab-height) !important;
          min-height: var(--mff-tab-height) !important;
        }
       
        .tabbrowser-tab[soundplaying="true"] {
          background-color: var(--mff-tab-soundplaying-bg) !important;
        }
       
        #tabs-newtab-button {
          opacity: 0.7;
        }
       
        .tab-icon-sound {
          display: none !important;
        }
       
       ::selection {
         background-color: ${runic.background};
         color           : ${runic.yellow};
         }
       
       #tabbrowser-tabs, #tabbrowser-tabs > #tabbrowser-arrowscrollbox {
         min-height: 0 !important; }
       
       #tabbrowser-tabs tab[first-visible-tab="true"][last-visible-tab="true"],
       #tabbrowser-tabs tab[first-visible-tab="true"][last-visible-tab="true"] + #tabs-newtab-button {
         visibility: collapse; }
       
       #tabbrowser-tabs tab { min-height: var(--tab-min-height); }
       
       
        /*
           ▄▖    ▜ ▌
           ▐ ▛▌▛▌▐ ▛▌▀▌▛▘
           ▐ ▙▌▙▌▐▖▙▌█▌▌
        */
       
        .urlbar-icon > image {
          fill: var(--mff-icon-color) !important;
          color: var(--mff-icon-color) !important;
        }
       
        .toolbarbutton-text {
          color: var(--mff-icon-color)  !important;
        }
        .urlbar-icon {
          color: var(--mff-icon-color)  !important;
        }
       
        #urlbar-results {
          font-family: var(--mff-urlbar-results-font-family);
          font-weight: var(--mff-urlbar-results-font-weight);
          font-size: var(--mff-urlbar-results-font-size) !important;
          color: var(--mff-urlbar-results-color) !important;
        }
       
        .urlbarView-row[type="bookmark"] > span{
          color: green !important;
        }
       
        .urlbarView-row[type="switchtab"] > span{
          color: orange !important;
        }
       
        .urlbarView-url, .search-panel-one-offs-container {
          color: var(--mff-urlbar-results-url-color) !important;
          font-family: var(--mff-urlbar-font-family);
          font-weight: var(--mff-urlbar-results-font-weight);
          font-size: var(--mff-urlbar-font-size) !important;
        }
       
        .urlbarView-favicon, .urlbarView-type-icon {
          display: none !important;
        }
       
        #urlbar-input {
          font-size: var(--mff-urlbar-font-size) !important;
          color: var(--mff-urlbar-color) !important;
          font-family: var(--mff-urlbar-font-family) !important;
          font-weight: var(--mff-urlbar-font-weight)!important;
          text-align: center !important;
        }
       
        #tracking-protection-icon-container, #identity-box {
          display: none;
        }
       
        #back-button > .toolbarbutton-icon{
          --backbutton-background: transparent !important;
          border: none !important;
        }
       
        toolbar {
          background-image: none !important;
        }
       
        #urlbar-background {
          opacity: .98 !important;
        }
       
        #navigator-toolbox, toolbaritem {
          border: none !important;
        }
       
        #urlbar-background {
          background-color: var(--mff-bg) !important;
          border: none !important;
        }
       
        .toolbar-items {
          background-color: var(--mff-bg) !important;
        }
       
        #sidebar-search-container {
          background-color: var(--mff-sidebar-bg) !important;
        }
       
        box.panel-arrowbox {
          display: none;
        }
       
        box.panel-arrowcontent {
          border-radius: 8px !important;
          border: none !important;
        }
       
        tab.tabbrowser-tab {
          overflow: hidden;
        }
       
        tab.tabbrowser-tab:hover {
          box-shadow: 0 1px 4px rgba(0,0,0,.05);
        }
       
        image#star-button {
          display: none;
        }
       
        toolbar#nav-bar {
          padding: var(--mff-nav-toolbar-padding) !important;
        }
       
        toolbar#nav-bar {
          padding: 4px !important;
        }
       
        #urlbar {
          max-width: 70% !important;
          margin: 0 15% !important;
          /*   position: unset!important; */;
        }
       
        #urlbar-input:focus {
          color: var(--mff-urlbar-focused-color) !important;
        }
       
       
        .megabar[breakout-extend="true"]:not([open="true"]) > #urlbar-background {
          box-shadow: none !important;
          background-color: transparent !important;
        }
       
        toolbarbutton {
          box-shadow: none !important;
        }
       
       
        /*
           ▄▖▘ ▌  ▌
           ▚ ▌▛▌█▌▛▌▀▌▛▘
           ▄▌▌▙▌▙▖▙▌█▌▌
        */
       
        .close-icon, .urlbar-icon {
          fill: var(--mff-icon-color) !important;
        }
       
        .sidebar-placesTree {
          color: var(--mff-sidebar-color) !important;
        }
       
        #sidebar-box {
          --sidebar-background-color: var(--mff-sidebar-bg) !important;
          --sidebar-foreground-color: var(--mff-sidebar-fg) !important;
        }
       
        splitter#sidebar-splitter {
          opacity: 0 !important;
        }
       
        splitter#sidebar-splitter {
          border: none !important;
          background-color: transparent !important;
        }
       
        image#sidebar-icon {
          display: none;
        }
       
        .panel-arrowcontent {
          padding: 0px !important;
          margin: 0px !important;
        }
       
        toolbarseparator {
          display: none;
        }
       
        td {
            color: ${runic
.background};
            width: 100%;
        }
       
        '';
        userContent =''
          *{ scrollbar-width: none }
          '';

    };
  };
}
