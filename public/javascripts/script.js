function formatearNumero(numero) {
    let num = parseInt(numero);
    let strNum = "";
    if (num > 0 && num < 10) {
        strNum = "0" + num;
    } else {
        strNum = num.toString();
    }
    return strNum;
}