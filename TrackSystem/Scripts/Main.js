function ContractAllSprints()
{
    $(".Sprint").each(function (index,element)
    {
        $(element).find("span").hide();
        $(element).find("br").hide();
        $(element).find(".description").show();
        $(".CommentsPane").hide();
        
    });
    ContractComments();
    
}

function ContractAllComments()
{
    $(".CommentsPivot").each(function (index, element)
    {
        $(element).parent().children(".ChildPost").hide();
    });
}

function ToggleComment(pivotButton)
{
    if ($(pivotButton).val() == "Ver Comentarios") {
        $(pivotButton).val("Ocultar Comentarios");
        ExpandComments(pivotButton);
    } else
    {
        $(pivotButton).val("Ver Comentarios");
        ContractComments(pivotButton);
    }
}

function ExpandComments(Node)
{
    $(Node).parent().children(".ChildPost").show();
}
function ContractComments(Node) {
    $(Node).parent().children(".ChildPost").hide();
}

function ExpandSprintNode(Node)
{
    
        $(Node).find("span").show();
    $(Node).find("br").show();
    $(Node).find(".CommentsPane").show();
    $(Node).find(".description").show();
    ContractComments();
    
    
}

function ContractSprintNode(Node) {

    $(Node).find("span").hide();
    $(Node).find("br").hide();
    $(Node).find(".CommentsPane").hide();
    $(Node).find(".description").show();
    ContractComments();

}

function ToggleSprint(sprintButton)
{
    if ($(sprintButton).val() == "+") {
        $(sprintButton).val("-");
        ExpandSprintNode($(sprintButton).parent().parent());
    } else
    {
        $(sprintButton).val("+");
        ContractSprintNode($(sprintButton).parent().parent());
    }
    
}


