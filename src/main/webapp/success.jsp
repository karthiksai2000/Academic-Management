<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student Assignment System</title>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header bg-dark text-white">
                        <h3 class="text-center">University Student Assignment Portal</h3>
                    </div>
                    <div class="card-body text-center">
                        <div class="mb-4">
                            <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" fill="currentColor" class="bi bi-journal-text" viewBox="0 0 16 16">
                                <path d="M5 10.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5z"/>
                                <path d="M3 0h10a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-1h1v1a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v1H1V2a2 2 0 0 1 2-2z"/>
                                <path d="M1 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1z"/>
                            </svg>
                        </div>
                        
                        <h4 class="mb-4">Welcome to the Student Assignment Management System</h4>
                        <p class="text-muted mb-4">Submit your assignments online with our easy-to-use system</p>
                        
                        <div class="d-grid gap-3 col-md-6 mx-auto">
                          
                            <a href="#" class="btn btn-outline-secondary btn-lg">
                                View Submitted Assignments
                            </a>
                        </div>
                        
                        <div class="mt-4">
                            <s:if test="hasActionMessages()">
                                <div class="alert alert-success">
                                    <s:actionmessage/>
                                </div>
                            </s:if>
                            
                            <s:if test="hasActionErrors()">
                                <div class="alert alert-danger">
                                    <s:actionerror/>
                                </div>
                            </s:if>
                        </div>
                    </div>
                </div>
                
                <div class="card mt-4">
                    <div class="card-body">
                        <h5>Submission Guidelines:</h5>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">✓ Student ID must be in format S12345</li>
                            <li class="list-group-item">✓ Minimum 300 words required for assignment content</li>
                            <li class="list-group-item">✓ All fields marked with * are mandatory</li>
                            <li class="list-group-item">✓ Assignments are automatically timestamped upon submission</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>