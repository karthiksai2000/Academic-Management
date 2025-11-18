<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Submitted Assignments</title>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .word-count-badge {
            font-size: 0.8em;
            padding: 0.25em 0.6em;
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2 class="text-primary">Submitted Assignments</h2>
            <s:url action="index" var="homeUrl"/>
            <a href="${homeUrl}" class="btn btn-outline-secondary">Back to Home</a>
        </div>
        
        <s:if test="hasActionMessages()">
            <div class="alert alert-info">
                <s:actionmessage/>
            </div>
        </s:if>
        
        <s:if test="hasActionErrors()">
            <div class="alert alert-danger">
                <s:actionerror/>
            </div>
        </s:if>
        
        <s:if test="assignments != null and assignments.size() > 0">
            <div class="alert alert-success">
                <strong><s:property value="message"/></strong>
            </div>
            
            <div class="table-responsive">
                <table class="table table-striped table-bordered">
                    <thead class="table-dark">
                        <tr>
                            <th>#</th>
                            <th>Student ID</th>
                            <th>Student Name</th>
                            <th>Course</th>
                            <th>Assignment Title</th>
                            <th>Word Count</th>
                            <th>Submission Date</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <s:iterator value="assignments" status="stat">
                            <tr>
                                <td><s:property value="#stat.count"/></td>
                                <td><s:property value="studentId"/></td>
                                <td><s:property value="studentName"/></td>
                                <td><s:property value="courseName"/></td>
                                <td><s:property value="assignmentTitle"/></td>
                                <td class="text-center">
                                    <s:if test="wordCount >= 300">
                                        <span class="badge bg-success word-count-badge">
                                            <s:property value="wordCount"/> ✓
                                        </span>
                                    </s:if>
                                    <s:else>
                                        <span class="badge bg-warning word-count-badge">
                                            <s:property value="wordCount"/> ✗
                                        </span>
                                    </s:else>
                                </td>
                                <td>
                                    <s:date name="submissionDate" format="dd/MM/yyyy HH:mm"/>
                                </td>
                                <td>
                                    <button class="btn btn-sm btn-outline-primary" 
                                            onclick="viewAssignment(
                                                '<s:property value="studentId"/>', 
                                                '<s:property value="studentName"/>',
                                                '<s:property value="courseName"/>',
                                                '<s:property value="assignmentTitle"/>',
                                                '<s:property value="wordCount"/>',
                                                '<s:date name="submissionDate" format="dd/MM/yyyy HH:mm"/>'
                                            )">
                                        View Details
                                    </button>
                                </td>
                            </tr>
                        </s:iterator>
                    </tbody>
                </table>
            </div>
        </s:if>
        <s:else>
            <div class="card">
                <div class="card-body text-center py-5">
                    <div class="text-muted mb-3">
                        <svg xmlns="http://www.w3.org/2000/svg" width="64" height="64" fill="currentColor" class="bi bi-inbox" viewBox="0 0 16 16">
                            <path d="M4.98 4a.5.5 0 0 0-.39.188L1.54 8H6a.5.5 0 0 1 .5.5 1.5 1.5 0 1 0 3 0A.5.5 0 0 1 10 8h4.46l-3.05-3.812A.5.5 0 0 0 11.02 4H4.98zm9.954 5H10.45a2.5 2.5 0 0 1-4.9 0H1.066l.32 2.562a.5.5 0 0 0 .497.438h12.234a.5.5 0 0 0 .496-.438L14.934 9zM3.809 3.563A1.5 1.5 0 0 1 4.981 3h6.038a1.5 1.5 0 0 1 1.172.563l3.7 4.625a.5.5 0 0 1 .105.374l-.39 3.124A1.5 1.5 0 0 1 14.117 13H1.883a1.5 1.5 0 0 1-1.489-1.314l-.39-3.124a.5.5 0 0 1 .106-.374l3.7-4.625z"/>
                        </svg>
                    </div>
                    <h4 class="text-muted">No Assignments Found</h4>
                    <p class="text-muted">No assignments have been submitted yet.</p>
                    <s:url action="assignment-form" var="formUrl"/>
                    <a href="${formUrl}" class="btn btn-primary">Submit First Assignment</a>
                </div>
            </div>
        </s:else>
    </div>

    <!-- Modal for assignment details -->
    <div class="modal fade" id="assignmentModal" tabindex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalTitle">Assignment Details</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body" id="modalContent">
                    <!-- Content will be loaded dynamically -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function viewAssignment(studentId, studentName, courseName, title, wordCount, submissionDate) {
            document.getElementById('modalTitle').innerText = title;
            document.getElementById('modalContent').innerHTML = 
                '<div class="row">' +
                '   <div class="col-md-6">' +
                '       <p><strong>Student ID:</strong> ' + studentId + '</p>' +
                '       <p><strong>Student Name:</strong> ' + studentName + '</p>' +
                '       <p><strong>Course:</strong> ' + courseName + '</p>' +
                '   </div>' +
                '   <div class="col-md-6">' +
                '       <p><strong>Assignment Title:</strong> ' + title + '</p>' +
                '       <p><strong>Word Count:</strong> ' + wordCount + '</p>' +
                '       <p><strong>Submitted on:</strong> ' + submissionDate + '</p>' +
                '   </div>' +
                '</div>' +
                '<div class="mt-3">' +
                '   <div class="alert ' + (parseInt(wordCount) >= 300 ? 'alert-success' : 'alert-warning') + '">' +
                '       <strong>Word Count Status:</strong> ' + 
                (parseInt(wordCount) >= 300 ? 'Meets requirement (≥300 words)' : 'Below requirement (<300 words)') +
                '   </div>' +
                '</div>';
            
            var modal = new bootstrap.Modal(document.getElementById('assignmentModal'));
            modal.show();
        }
    </script>
</body>
</html>