var num = prompt("Enter amount of times to flood your history?\n");
done = false;
x = window.location.href;
var waiting_prompt = false;
for (var i = 1; i <= num; i++) {
    history.pushState(0, 0, i == num ? x : i.toString());
    if (i == num) {
        alert("Success!\n " + window.location.href + " \n was flooded " + num + (num == 1 ? " time." : " times. \nby https://github.com/kuraise"));
    }
}

// --> minified version

javascript:var num=prompt("Enter amount of times to flood your history?\n");done=!1,x=window.location.href;for(var waiting_prompt=!1,i=1;i<=num;i++)history.pushState(0,0,i==num?x:i.toString()),i==num&&alert("Success!\n "+window.location.href+" \n was flooded "+num+(1==num?" time.":" times. \nby https://github.com/kuraise"));
