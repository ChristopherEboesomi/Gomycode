
import pickle
import streamlit as st

#Loading the trained model

pickle_in = open('classifier.pkl','rb')
classifier=pickle.load(pickle_in)

@st.cache()

# defining the function which will make the prediction using the data which the user input
def prediction(Amount_Orig, step, type, amount, Amount_Dest):
    
     #pre-processing user input
    if type == 'CASH OUT':
        type = 1
    elif type == 'DEBIT':
        type = 2
    elif type == 'CASH IN':
        type = 0
    elif type == 'PAYMENT':
        type = 3
    elif type == 'TRANSFER':
        type = 4
  
    
    # Making predictions
    prediction=classifier.predict([[Amount_Orig, step, type, amount, Amount_Dest]])
    if prediction ==0:
        pred='legit'
    else:
        pred='Fraud'
        
    return pred
# This is the main function in which we define our webpage 


def main():
    # front end element of the web page
    
    html_temp = '''
    <div style = 'background-colour:yellow;padding:13px'>
    <h1 style = 'color:yellow;text_align:center;'>Streamlit online_payment Fraud Prediction ML App </h1>
    </div>
    '''
     
   # display the front end aspect 
    st.markdown(html_temp,unsafe_allow_html=True)

   # following Lines create boxes in which user can enter data required to make prediction
    Amount_Orig=st.number_input("Amount_Orig")
    step=st.number_input("Step")
    amount=st.number_input("Amount")
    type=st.selectbox('Type',("PAYMENT","TRANSFER","CASH OUT","DEBIT","CASH IN"))
    Amount_Dest=st.number_input("Amount_Dest")
    
    
    result = ""
    
    # Convert 'amount' to float
    amount = float(amount)

#when 'predict' is clicked,make the prediction and store it
    if st.button("Predict"):
        result=prediction(Amount_Orig, step, type, amount, Amount_Dest)
        st.success('Your OnlinePayment is {}'.format(result))
        print(result)
        
if __name__== '__main__':
    main()
