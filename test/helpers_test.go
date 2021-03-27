package test

import (
	"context"
	"fmt"
	"testing"

	"github.com/gruntwork-io/terratest/modules/k8s"
	v1 "k8s.io/api/rbac/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

// Returns a ClusterRoleBinding object with the given name and namespace.
// Will fail the test if the ClusterRoleBinding does not exist.
func getClusterRoleBinding(t *testing.T, options *k8s.KubectlOptions, roleBindingName string) *v1.ClusterRoleBinding {
	clientset, err := k8s.GetKubernetesClientFromOptionsE(t, options)
	if err != nil {
		fmt.Print(err)
		t.Fail()
	}

	roleBinding, err := clientset.RbacV1().
		ClusterRoleBindings().
		Get(context.Background(), roleBindingName, metav1.GetOptions{})
	if err != nil {
		fmt.Print(err)
		t.Fail()
	}

	return roleBinding
}
