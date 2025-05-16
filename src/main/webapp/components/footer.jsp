<%-- src/main/webapp/components/footer.jsp --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<footer class="footer mt-4 py-4 text-center text-gray-500 text-sm">
    <p>&copy; <%= java.time.LocalDate.now().getYear() %> MediCare. All rights reserved.</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>