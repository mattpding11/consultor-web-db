$(document).ready(function () {

    const elementTablePeriodo = "#periodo_table tbody tr";
    const elementTableDocente = "#docente_table tbody tr";

    $(elementTablePeriodo).click(function (element) {

        const codigoPeriodoId = $(element.target).attr('id');
        const codigoPeriodoValor = $(element.target).text();

        if(codigoPeriodoId === "codigoPeriodo"){
             const form = $('<form style="visibility: hidden" action="periodos_2.php" method="POST" >'+
           '<input type="text" name="codigo_periodo" value='+codigoPeriodoValor+'>'+
           '</form>');
            $('body').append(form);
            form.submit();
        }
    });

    $(elementTableDocente).click(function (element) {

        const codigoDocenteId = $(element.target).attr('id');
        const codigoDocenteValor = $(element.target).text();

        if(codigoDocenteId === "codigoProfesor"){
            const form = $('<form style="visibility: hidden" action="docentes_2.php" method="POST" >'+
                '<input type="text" name="codigo_profesor" value='+codigoDocenteValor+'>'+
                '</form>');
            $('body').append(form);
            form.submit();
        }
    });
})



