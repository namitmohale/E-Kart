/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package featureextraction;

import org.ejml.data.DenseMatrix64F;
import org.ejml.ops.CommonOps;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Rajesh
 */
public class FNormFeature extends HttpServlet {
   



    public DenseMatrix64F[] extract(DenseMatrix64F[] matrixs) {
        for (int i = 0; i < matrixs.length; i++) {
            matrixs[i] = extract(matrixs[i]);
        }
        return matrixs;
    }

    public DenseMatrix64F extract(DenseMatrix64F matrix) {
        DenseMatrix64F featureVector = new DenseMatrix64F(1, matrix.getNumCols());
        double deltaAf = 0;
        double prevDeltaAf = 0;

        for (int i = 0; i < matrix.getNumCols(); i++) {
            DenseMatrix64F subMatrix = CommonOps.extract(matrix, 0, i + 1, 0, i + 1);
            deltaAf = fnorm(subMatrix);
            double deltaA = deltaAf - prevDeltaAf;
            featureVector.set(0, i, deltaA);
            prevDeltaAf = deltaAf;
        }

        //System.out.println(featureVector.getNumCols());
        return featureVector;
    }

    public double fnorm(DenseMatrix64F subMatrix) {
        double sumDeltaA = 0;
        // calculate f-norm
        for (int k = 0; k < subMatrix.getNumRows(); k++) {
            for (int l = 0; l < subMatrix.getNumCols(); l++) {
                sumDeltaA = sumDeltaA + (subMatrix.get(k, l) * subMatrix.get(k, l));
            }
        }

        return Math.sqrt(sumDeltaA);
    }

    public double calculateSimilarity(DenseMatrix64F featureVectorA, DenseMatrix64F featureVectorB) {
        double sumAlpha = 0;
        int n = featureVectorA.getNumCols();

        int nPow2 = n * n;
        //double sumc = 0;
        for (int i = 0; i < n; i++) {
            double deltaA = featureVectorA.get(0, i);
            double deltaB = featureVectorB.get(0, i);

            double I = (double) (i + 1);
            double c = (((2 * I) - 1) / nPow2);
            double alpha = 0;

            if (deltaA == 0 || deltaB == 0) {
                alpha = 1;
            } else {
                //System.out.println("c " + c);
                //sumc = sumc + c;
                alpha = (Math.min(deltaA, deltaB) / Math.max(deltaA, deltaB));
                //System.out.println("alpha = " + alpha);

            }
            sumAlpha = sumAlpha + (c * alpha);
            //System.out.println("suma "+sumAlpha);
        }
        //System.out.println("sumc " + sumc);
        return sumAlpha;
    }

    public double[] calculateVariance(DenseMatrix64F[] fnorms) {
        int n = fnorms.length;
        double[] variances = new double[n];
        for (int i = 0; i < n; i++) {
            variances[i] = calculateVariance(fnorms[i]);
        }

        return variances;
    }

    public double calculateVariance(DenseMatrix64F fnorm) {
        double sumCoeff = 0;
        for (int i = 0; i < fnorm.getNumCols(); i++) {
            sumCoeff = sumCoeff + fnorm.get(0, i);
        }

        double mean = sumCoeff / fnorm.getNumCols();
        double stdDev = 0;
        for (int i = 0; i < fnorm.getNumCols(); i++) {
            double delta = fnorm.get(0, i) - mean;
            stdDev = stdDev + (delta * delta);
        }
        stdDev = stdDev / fnorm.getNumCols();

        return Math.sqrt(stdDev);
    }

    public DenseMatrix64F[] extractCoeff(DenseMatrix64F[] waveletCoefficients, String coeff) {
        int n = waveletCoefficients.length;
        DenseMatrix64F[] extract = new DenseMatrix64F[n];
        for (int i = 0; i < n; i++) {
            extract[i] = extractCoeff(waveletCoefficients[i], i, coeff);
        }

        return extract;

    }

    public DenseMatrix64F extractCoeff(DenseMatrix64F waveletCoefficient, int level, String coeff) {
        int numDimension = waveletCoefficient.getNumCols();
        int halfDimension = numDimension / 2;
        DenseMatrix64F extract = new DenseMatrix64F(halfDimension, halfDimension);
        int startX = 0;
        int endX = numDimension;
        int startY = 0;
        int endY = numDimension;

        if ("LL".equals(coeff)) {
            endX = halfDimension;
            endY = halfDimension;
        }

        if ("LH".equals(coeff)) {
            startX = halfDimension;
            endY = halfDimension;
        }

        if ("HL".equals(coeff)) {
            endX = halfDimension;
            startY = halfDimension;
        }

        if ("HH".equals(coeff)) {
            startX = halfDimension;
            startY = halfDimension;
        }

        for (int i = 0, x = startX; x < endX; x++, i++) {
            for (int j = 0, y = startY; y < endY; j++, y++) {
                extract.set(j, i, waveletCoefficient.get(y, x));
            }
        }
        return extract(extract);
    }



    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet FNormFeature</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FNormFeature at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
            */
        } finally { 
            out.close();
        }
    }
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
