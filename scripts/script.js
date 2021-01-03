function textCounter(field, cntfield, maxlimit) 
{
    field = document.getElementById(field);           
    
    cntfield = document.getElementById(cntfield); // imp otherwise throws error in IE on focusOut from textbox
    //cntfield.width = "330px";
    cntfield.value = maxlimit + field.value.length;

    if (cntfield.value <= 650) 
    {
        cntfield.className = "greenClass";
        cntfield.value = cntfield.value + " characters are entered";
    }
    else if (cntfield.value >= 650 && cntfield.value < 700) 
    {
        cntfield.className = "yellowClass";
        cntfield.value = cntfield.value + " characters are entered, You are nearing 700 characters limit"
    }
    else if (cntfield.value >= 700)
    {
        cntfield.className = "redClass";
        cntfield.value = cntfield.value + " characters limit is reached. If You exceed the 700 character limit the report will appear distorted...";
    }           
}         
