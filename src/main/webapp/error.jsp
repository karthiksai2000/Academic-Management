<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>Error</title>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header bg-danger text-white">
                        <h3 class="text-center">Error Occurred</h3>
                    </div>
                    <div class="card-body text-center">
                        <div class="mb-4">
                            <i class="fas fa-exclamation-triangle fa-5x text-danger"></i>
                        </div>
                        
                        <s:if test="hasActionErrors()">
                            <div class="alert alert-danger">
                                <s:actionerror/>
                            </div>
                        </s:if>
                        
                        <s:if test="exception != null">
                            <div class="alert alert-warning">
                                <strong>Exception:</strong> <s:property value="exception.message"/>
                            </div>
                        </s:if>
                        
                        <p class="text-muted">An error occurred while processing your request. Please try again.</p>
                        
                        <div class="mt-4">
                            <a href="index.jsp" class="btn btn-primary">Home</a>
                            <a href="assignment-form.jsp" class="btn btn-secondary">Back to Form</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Font Awesome for icons -->
    <script src="https://kit.fontawesome.com/your-fontawesome-kit.js"></script>
</body>
</html>