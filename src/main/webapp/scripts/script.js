function showVideo() {
    $('#PnlTabellaVideo').removeClass("d-none");
    $('#PnlNoVideo').removeClass("d-none");
    $('#PnlTabellaAudio').addClass("d-none");
    $('#PnlNoAudio').addClass("d-none");
    $('#PnlDaschboard').addClass("d-none");
    $('#BtnReportVideo').class("btn-menu-active");
    $('#BtnReportAudio').class("btn-menu");
    $('#BtnDaschboard').class("btn-menu");
}

function showAudio() {
    $('#PnlTabellaVideo').addClass("d-none");
    $('#PnlNoVideo').addClass("d-none");
    $('#PnlTabellaAudio').removeClass("d-none");
    $('#PnlNoAudio').removeClass("d-none");
    $('#PnlDaschboard').addClass("d-none");
    $('#BtnReportVideo').removeClass("btn-menu-active");
    $('#BtnReportVideo').addClass("btn-menu");
    $('#BtnReportAudio').class("btn-menu-active");
    $('#BtnDaschboard').class("btn-menu");
}

function showParametri() {
    $('#PnlTabellaVideo').addClass("d-none");
    $('#PnlNoVideo').addClass("d-none");
    $('#PnlTabellaAudio').addClass("d-none");
    $('#PnlNoAudio').addClass("d-none");
    $('#PnlDaschboard').removeClass("d-none");
    $('#BtnReportVideo').class("btn-menu");
    $('#BtnReportAudio').class("btn-menu");
    $('#BtnDaschboard').class("btn-menu-active");
}