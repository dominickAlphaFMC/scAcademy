import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import sendEmail from '@salesforce/apex/ClassComponentController.sendEmail';

export default class ClassComponent extends LightningElement {

    toAddress; //pretty much the same as String myString = new String();
    subject;
    body;

    //public static void handleSendButtonClick() {

   // }
    handleSendButtonClick() {
        sendEmail({
            toAddress : this.toAddress,
            subject : this.subject,
            body : this.body        
        }).then(result => {
            this.showNotification();
        }).catch(error => {
        
        });
    }

    handleInputChange(event) {
        var componentName = event.target.name;
        //CHANGE TO A SWITCH CASE
        /*
        if (componentName == 'toAddress') {
            this.toAddress = event.detail.value;
        } else if (componentName == 'subject') {
            this.subject = event.detail.value;
        } else if (componentName == 'body') {
            this.body = event.detail.value;
        }*/

        switch (componentName) {
            case 'toAddress':
                this.toAddress = event.detail.value;
            case 'subject':
                this.subject = event.detail.value;
            case 'body':
                this.body = event.detail.value;
        }
    }


    showNotification() {
        var toastEvent = new ShowToastEvent({
            title: 'Hooray!',
            message: 'Message successfully sent',
            variant: 'success',
        });
        this.dispatchEvent(toastEvent);
    }



    /*
        console.log('IM DEBUGGING!');
        console.log('TO ADDRESS');
        console.log(this.toAddress);
        console.log('Subject');
        console.log(this.subject);
        console.log('Body');
        console.log(this.body);
    */
}