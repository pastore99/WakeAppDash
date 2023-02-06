function showVideo() {
    $('#PnlTabellaVideo').removeClass("d-none");
    $('#PnlNoVideo').removeClass("d-none");
    $('#PnlTabellaAudio').addClass("d-none");
    $('#PnlNoAudio').addClass("d-none");
    $('#PnlDaschboard').addClass("d-none");
}

function showAudio() {
    $('#PnlTabellaVideo').addClass("d-none");
    $('#PnlNoVideo').addClass("d-none");
    $('#PnlTabellaAudio').removeClass("d-none");
    $('#PnlNoAudio').removeClass("d-none");
    $('#PnlDaschboard').addClass("d-none");
}

function showParametri() {
    $('#PnlTabellaVideo').addClass("d-none");
    $('#PnlNoVideo').addClass("d-none");
    $('#PnlTabellaAudio').addClass("d-none");
    $('#PnlNoAudio').addClass("d-none");
    $('#PnlDaschboard').removeClass("d-none");
}