<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo; section>
    <#if section = "title">
        ${msg("loginTitle",(realm.displayName!''))}
    <#elseif section = "header">
        <link href="https://fonts.googleapis.com/css?family=Muli" rel="stylesheet"/>
        <link href="${url.resourcesPath}/img/icon.ico" rel="icon"/>
        <script>
            function togglePassword() {
                var x = document.getElementById("password");
                var v = document.getElementById("vi");
                if (x.type === "password") {
                    x.type = "text";
                    v.src = "${url.resourcesPath}/img/eye.png";
                } else {
                    x.type = "password";
                    v.src = "${url.resourcesPath}/img/eye-off.png";
                }
            }
        </script>
    <#elseif section = "form">
		<div class="box-main-container">
			<div class="img-box">
				<img class="logo" src="${url.resourcesPath}/img/logo.png" alt="Akasafe">
			</div>
			<div class="project-name">
				<span class="application-name">
                    <span class="safe-title">Sign In</span>
                    <span class="safe-sub-title">Use your akaSAFE Account</span>
                </span>
			</div>
            <div class="box-container">            
                <#if realm.password>
                <div>
                    <form id="kc-form-login" class="form" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                            <input id="username" class="login-field" placeholder="${msg("username")}" type="text" name="username" tabindex="1">
                            <div>
                                <label class="visibility" id="v" onclick="togglePassword()"><img id="vi" src="${url.resourcesPath}/img/eye-off.png"></label>
                            </div>
                            <input id="password" class="login-field" placeholder="${msg("password")}" type="password" name="password" tabindex="2">
                        
                            <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                                <div id="kc-form-options">
                                    <#if realm.rememberMe && !usernameEditDisabled??>
                                        <div class="checkbox">
                                            <label>
                                                <#if login.rememberMe??>
                                                    <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" checked> ${msg("rememberMe")}
                                                <#else>
                                                    <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox"> ${msg("rememberMe")}
                                                </#if>
                                            </label>
                                        </div>
                                    </#if>
                                    </div>
                                <div class="forgotPassword">
                                    <#if realm.resetPasswordAllowed>
                                        <span><a tabindex="5" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
                                    </#if>
                                </div>
                            </div>

                        <input class="submit" type="submit" value="${msg("doLogIn")}" tabindex="3">
                        </form>
                    </div>
                </div>
            </div>
        
            <div class="box-image-product" style="background-image: url(&quot;${url.resourcesPath}/img/Artboard5.png&quot;); heigh:100%; width:40%;">
            </div>

        </div>
        </#if>
        <#if social.providers??>
            <p class="para">${msg("selectAlternative")}</p>
            <div id="social-providers">
                <#list social.providers as p>
                <input class="social-link-style" type="button" onclick="location.href='${p.loginUrl}';" value="${p.displayName}"/>
                </#list>
            </div>
        </#if>
        <#if realm.password && realm.registrationAllowed && !usernameEditDisabled??>
            <div id="kc-registration">
                <span>${msg("noAccount")} <a tabindex="6" href="${url.registrationUrl}">${msg("doRegister")}</a></span>
            </div>
		</#if>
    </#if>
</@layout.registrationLayout>
