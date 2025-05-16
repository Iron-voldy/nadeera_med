<%-- src/main/webapp/components/header.jsp --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header class="header">
    <div class="header-left">
        <button class="mobile-menu-btn">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" width="24" height="24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"></path>
            </svg>
        </button>
        <h1 class="header-title">${param.pageTitle}</h1>
    </div>
    <div class="user-menu">
        <img src="${pageContext.request.contextPath}/assets/images/default-avatar.png" alt="Admin" class="user-avatar">
        <span class="user-name">Admin User</span>
    </div>
</header>