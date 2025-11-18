<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Assignment Submission</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .word-count { font-size: 0.9em; color: #6c757d; }
        .word-count.warning { color: #dc3545; }
        .word-count.success { color: #198754; }
        .error-message { color: #dc3545; font-size: 0.875em; margin-top: 0.25rem; }
        .form-control.error { border-color: #dc3545; }
    </style>
</head>
<body>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-10">
            <div class="card shadow-sm">
                <div class="card-header bg-primary text-white text-center">
                    <h3>University Assignment Submission System</h3>
                </div>
                <div class="card-body">
                    <s:form action="submit-assignment" method="post" theme="simple">

                        <!-- Global action errors -->
                        <s:if test="hasActionErrors()">
                            <div class="alert alert-danger">
                                <s:actionerror/>
                            </div>
                        </s:if>

                        <!-- Student ID and Name -->
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <s:label value="Student ID *" cssClass="form-label"/>
                                <s:textfield 
                                    name="assignment.studentId" 
                                    cssClass="form-control %{fieldErrors['assignment.studentId']!=null?'error':''}" 
                                    placeholder="Enter Student ID (Format: S12345)"/>
                                <s:if test="fieldErrors['assignment.studentId'] != null">
                                    <s:fielderror fieldName="assignment.studentId" cssClass="error-message"/>
                                </s:if>
                                <div class="form-text">Format: S followed by 5 digits (e.g., S12345)</div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <s:label value="Student Name *" cssClass="form-label"/>
                                <s:textfield 
                                    name="assignment.studentName" 
                                    cssClass="form-control %{fieldErrors['assignment.studentName']!=null?'error':''}" 
                                    placeholder="Enter Full Name"/>
                                <s:if test="fieldErrors['assignment.studentName'] != null">
                                    <s:fielderror fieldName="assignment.studentName" cssClass="error-message"/>
                                </s:if>
                            </div>
                        </div>

                        <!-- Course Name -->
                        <div class="mb-3">
                            <s:label value="Course Name *" cssClass="form-label"/>
                            <s:textfield 
                                name="assignment.courseName" 
                                cssClass="form-control %{fieldErrors['assignment.courseName']!=null?'error':''}" 
                                placeholder="Enter Course Name"/>
                            <s:if test="fieldErrors['assignment.courseName'] != null">
                                <s:fielderror fieldName="assignment.courseName" cssClass="error-message"/>
                            </s:if>
                        </div>

                        <!-- Assignment Title -->
                        <div class="mb-3">
                            <s:label value="Assignment Title *" cssClass="form-label"/>
                            <s:textfield 
                                name="assignment.assignmentTitle" 
                                cssClass="form-control %{fieldErrors['assignment.assignmentTitle']!=null?'error':''}" 
                                placeholder="Enter Assignment Title"/>
                            <s:if test="fieldErrors['assignment.assignmentTitle'] != null">
                                <s:fielderror fieldName="assignment.assignmentTitle" cssClass="error-message"/>
                            </s:if>
                        </div>

                        <!-- Assignment Content -->
                        <div class="mb-3">
                            <s:label value="Assignment Content *" cssClass="form-label"/>
                            <s:textarea 
                                name="assignment.assignmentContent" 
                                cssClass="form-control %{fieldErrors['assignment.assignmentContent']!=null?'error':''}" 
                                rows="8" 
                                placeholder="Write your assignment content here..." 
                                onkeyup="updateWordCount(this)"/>
                            <s:if test="fieldErrors['assignment.assignmentContent'] != null">
                                <s:fielderror fieldName="assignment.assignmentContent" cssClass="error-message"/>
                            </s:if>
                            <div id="wordCount" class="word-count">Word count: 0 (Minimum 300 words required)</div>
                        </div>

                        <!-- Form buttons -->
                        <div class="d-flex justify-content-end gap-2">
                            <s:url action="index" var="homeUrl"/>
                            <a href="${homeUrl}" class="btn btn-secondary">Cancel</a>
                            <s:submit value="Submit Assignment" cssClass="btn btn-primary"/>
                        </div>

                    </s:form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function updateWordCount(textarea) {
        const text = textarea.value.trim();
        const count = text ? text.split(/\s+/).length : 0;
        const wordCountEl = document.getElementById('wordCount');
        wordCountEl.textContent = `Word count: ${count} (Minimum 300 words required)`;
        wordCountEl.className = count < 300 ? 'word-count warning' : 'word-count success';
    }

    document.addEventListener('DOMContentLoaded', () => {
        const textarea = document.querySelector('textarea[name="assignment.assignmentContent"]');
        if (textarea) updateWordCount(textarea);
    });
</script>
</body>
</html>
